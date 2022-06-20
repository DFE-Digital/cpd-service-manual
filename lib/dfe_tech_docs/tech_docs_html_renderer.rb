# frozen_string_literal: true

module DfETechDocs
  class TechDocsHTMLRenderer < GovukTechDocs::TechDocsHTMLRenderer
    def initialize(options = nil)
      super
    end

    def block_code(code, language)
      case language
      when 'mermaid'
        document = Nokogiri::XML::DocumentFragment.parse("<code></code>")
        mermaid = document.at_css("code")
        mermaid['class'] = language
        mermaid.content = code
        mermaid.to_html
      else
        super
      end
    end
  end
end
