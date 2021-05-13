require 'govuk_tech_docs'

require_relative "lib/requires"

GovukTechDocs.configure(self)

set :layout, 'custom'
ignore "templates/*"

SERVICE_DOCS = [
  {
    title: "Manage training for early career teachers runbooks",
    pages: GitHubRepoFetcher.instance.docs(
      service_name: "Manage training for early career teachers",
      repo_name: "DFE-Digital/early-careers-framework",
      path_in_repo: "documentation",
      path_prefix: "runbooks/early-careers-framework",
      # ignore_files: %w[api.md],
    ),
  },
  {
    title: "CPD Payment calculations runbooks",
    pages: GitHubRepoFetcher.instance.docs(
      service_name: "CPD Payment calculations",
      repo_name: "DFE-Digital/cpd-payment-calculations",
      path_in_repo: "doc",
      path_prefix: "runbooks/cpd-payment-calculations",
      # ignore_files: %w[api.md],
    ),
  },
  {
    title: "CPD Payment calculations ADR",
    pages: GitHubRepoFetcher.instance.docs(
      service_name: "CPD Payment calculations",
      repo_name: "DFE-Digital/cpd-payment-calculations",
      path_in_repo: "doc/adr",
      path_prefix: "adr/cpd-payment-calculations",
      # ignore_files: %w[api.md],
    ),
  },
].freeze

helpers do
  def service_docs
    SERVICE_DOCS
  end

  def pages_by_category
    PagesByCategory.new(sitemap)
  end

  # Returns all pages under a certain directory.
  def sub_pages(dir)
    sitemap.resources.select do |resource|
      resource.url.start_with?(dir) && resource.url != dir
    end
  end
end

SERVICE_DOCS.each do |service_doc|
  service_doc[:pages].each do |page|
    proxy page.fetch(:path), "templates/external_doc_template.html", page.fetch(:proxy_args)
  end
end
