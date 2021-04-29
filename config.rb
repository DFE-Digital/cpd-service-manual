require 'govuk_tech_docs'

GovukTechDocs.configure(self)

set :layout, 'custom'

configure :build do
  # Relative assets needed to deploy to Github Pages
  activate :relative_assets
  set :site_url, "/cpd-service-manual"
end
