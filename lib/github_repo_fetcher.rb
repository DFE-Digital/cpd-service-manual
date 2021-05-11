require "octokit"

require "faraday-http-cache"
require "faraday_middleware"

class GitHubRepoFetcher
  include Singleton

  def docs(repo_name:, path_in_repo:, path_prefix:, service_name:, ignore_files: [])
    directory_contents = client.contents(repo_name, path: path_in_repo)
    markdown_files = directory_contents.select { |doc| doc.name.end_with?(".md") && !doc.name.in?(ignore_files) }

    pages = markdown_files.map do |file|
      contents = HTTP.get_cached(file.download_url)
      filename = file.name.match(/(.+)\..+$/)[1]
      title = ExternalDoc.title(contents) || filename

      {
        path: "#{path_prefix}/#{filename}.html",
        title: title,
        proxy_args: {
          locals: {
            service_name: service_name,
            title: title,
            external_doc_contents: ExternalDoc.parse(contents, repo_name: repo_name, path: file.path),
          },
          data: {
            # Title in search results
            category: service_name,
            original_title: title,
            title: "#{service_name} - #{title}",
            source_url: file.html_url,
          },
        },
      }
    end

    # Sort the pages by title.
    pages.sort_by do |page|
      title = page.fetch(:title)
      # Because of lexicographical ordering, by default the ADRs would be ordered
      # like 1, 10, 11, 12, 2, etc. To correctly order we need to translate the
      # titles into integers. This will crash if some pages in the source directory
      # have leading numbers, and others have not.
      first_integer = title.scan(/\d+/).first
      first_integer ? first_integer.to_i : title
    end
  end

private

  def client
    @client ||= begin
      stack = Faraday::RackBuilder.new do |builder|
        builder.response :logger
        builder.use Faraday::HttpCache, serializer: Marshal, shared_cache: false
        builder.use Octokit::Response::RaiseError
        builder.use Faraday::Request::Retry, exceptions: Faraday::Request::Retry::DEFAULT_EXCEPTIONS + [Octokit::ServerError]
        builder.adapter Faraday.default_adapter
      end

      Octokit.middleware = stack

      github_client = Octokit::Client.new(access_token: ENV["GITHUB_TOKEN"])
      github_client.auto_paginate = true
      github_client
    end
  end
end
