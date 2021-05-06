require 'govuk_tech_docs'

GovukTechDocs.configure(self)

set :layout, 'custom'

activate :robots,
  rules: [
    { user_agent: '*', disallow: %w[/] }
  ]
  # sitemap: 'https://example.com/sitemap.xml'

configure :build do
  # Relative assets needed to deploy to Github Pages
  activate :relative_assets
  set :http_prefix, '/cpd-service-manual'
  # set :site_url, "/cpd-service-manual"
end

helpers do
  # Returns all pages under a certain directory.
  def sub_pages(dir)
    sitemap.resources.select do |resource|
      resource.url.start_with?(dir) && resource.url != dir
    end
  end
end
