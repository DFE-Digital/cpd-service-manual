# frozen_string_literal: true

module Pages
  class BasePage < SitePrism::Page
    include RSpec::Matchers

    element :header, "h1"

    load_validation do
      [has_primary_heading?, "Primary heading \"#{primary_heading}\" not found on page"]
    end

    def self.load(*args)
      page_object = new
      page_object.load(*args)
      page_object
    end

    def self.loaded(*args)
      page_object = new
      is_displayed = page_object.displayed?(*args)
      is_loaded = page_object.loaded?

      if is_displayed && is_loaded
        page_object
      else
        raise "Expected #{page_object.url_matcher} to match #{page_object.current_path}"
      end
    end

    class << self
      attr_reader :primary_heading

      # Sets and returns the specific primary_heading that will be displayed for a page object
      #
      # @return [String]
      def set_primary_heading(primary_heading)
        @primary_heading = primary_heading
      end
    end

    def has_primary_heading?(_seconds = Capybara.default_max_wait_time)
      raise "primary_heading has not been set" if primary_heading.nil?

      element_has_content? header, primary_heading
    end

    def element_visible?(elem)
      if elem.visible?
        true
      else
        raise RSpec::Expectations::ExpectationNotMetError, "expected the element #{elem} to be visible"
      end
    end

    def element_hidden?(elem)
      if elem.visible?
        raise RSpec::Expectations::ExpectationNotMetError, "expected the element #{elem} to be hidden"
      else
        true
      end
    end

    def element_has_content?(elem, expectation)
      if elem.has_content? expectation
        true
      else
        raise RSpec::Expectations::ExpectationNotMetError, "expected to find \"#{expectation}\" within\n===\n#{elem.text}\n==="
      end
    end

    def element_without_content?(elem, expectation)
      if elem.has_content? expectation
        raise RSpec::Expectations::ExpectationNotMetError, "expected to not find \"#{expectation}\" within\n===\n#{elem.text}\n==="
      else
        true
      end
    end

    def go_back
      click_on "Back"
    end

    # helpers that can show what capybara sees

    def show_html
      puts page.html
    end

    def show_all_content
      puts page.text
    end

    def show_main_content
      puts page.find("main").text
    end

    def show_links
      links = page.all("main a").map { |link| "  - #{link.text} href: #{link['href']}" }
      puts links
    end

    # helper whilst debugging scenarios with --fail-fast

    def full_stop(html: false)
      puts "==="
      puts page.current_url
      puts "---"
      if html
        show_html
      else
        show_main_content
      end
      puts "---"
      show_links
      puts "==="
      raise
    end

  private

    def primary_heading
      self.class.primary_heading
    end
  end
end
