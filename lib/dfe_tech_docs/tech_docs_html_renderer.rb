# frozen_string_literal: true

module DfETechDocs
  class TechDocsHTMLRenderer < GovukTechDocs::TechDocsHTMLRenderer
    def initialize(options = nil)
      super
    end

    def block_code(code, language)
      case language
      when 'mermaid'
        fragment = Nokogiri::HTML::DocumentFragment.parse('')
        mermaid = Nokogiri::XML::Node.new 'code', fragment
        mermaid['class'] = language
        mermaid.content = code
        mermaid.to_html
      else
        super
      end
    end
  end
end
