# frozen_string_literal: true

require "diffy"
require "htmlbeautifier"

module SnapshotDiffHelper
  class Comparator
    def initialize(name, old_file_path, new_file_path, options = {})
      @name = name
      @old_file_path = old_file_path
      @new_file_path = new_file_path
      @options = options
    end

    def compare
      if @old_file_path.nil? || @new_file_path.nil?
        raise ArgumentError, "An `old_file_path` and `new_file_path` are required to make the comparison"
      end
      if @old_file_path == @new_file_path
        raise ArgumentError, "The `old_file_path` and `new_file_path` cannot be the same file"
      end

      if File.exist?(@old_file_path)
        old_beautified_html_path = beautified_html(@old_file_path)
        new_beautified_html_path = beautified_html(@new_file_path)

        diff = Diffy::Diff.new(old_beautified_html_path, new_beautified_html_path, context: 2, include_diff_info: true, source: "files")
        result = diff.to_s(:color).strip

        File.delete old_beautified_html_path
        File.delete new_beautified_html_path

        unless result.empty?
          error_message = <<~EXPECTATION_MESSAGE
            The content of "#{@name}" has been modified

            (compared using Diffy::Diff)

            #{result}
          EXPECTATION_MESSAGE

          raise RSpec::Expectations::ExpectationNotMetError, error_message
        end
      else
        File.rename @new_file_path, @old_file_path
      end

      true
    end

    def beautified_html(file)
      raise ArgumentError, "#{file} not found" unless File.exist?(file)

      doc = Nokogiri.HTML(File.read(file))

      # Add line breaks to get diff by elements
      doc.traverse { |x| x.content = "\n#{x.content.strip}\n" if x.text? }

      node = doc.css(target_selector || default_selector)
      raise("Couldn't find the selector [#{target_selector}] in #{file}") if node.empty?

      beautified_html = HtmlBeautifier.beautify(node.to_html)
      beautified_html_path = "#{file}.beauty"

      File.write beautified_html_path, beautified_html

      beautified_html_path
    end

  private

    def target_selector
      @options.fetch(:selector, nil)
    end

    def default_selector
      "body > *"
    end
  end

  def check_page(name, options = {})
    raise ArgumentError, "options must be hash" unless options.is_a?(Hash)

    path_from_name = name.gsub(/[^a-z0-9\-_]+/i, "_")
    filename = File.join("#{path_from_name}.html")
    save_page filename

    old_html_path = File.expand_path(File.join("spec", "support", "features", "snapshots", filename))
    new_html_path = File.expand_path(File.join(Capybara.save_path, filename))

    Comparator.new(name, old_html_path, new_html_path, options).compare
  end
end
