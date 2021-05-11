class PagesByCategory
  attr_reader :sitemap

  def initialize(sitemap)
    @sitemap = sitemap
  end

  def pages
    sitemap.resources
      .select { |resource| resource.path.end_with?(".html") && resource.data.category }
      .group_by { |resource| resource.data.category }
  end
end
