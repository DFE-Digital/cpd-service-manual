# frozen_string_literal: true

module DfETechDocs
  class TechDocsHTMLRenderer < GovukTechDocs::TechDocsHTMLRenderer
    def initialize(options = nil)
      super
    end

    def block_code(code, lang)
      if lang == "mermaid"
        block_mermaid_svg(code)
      else
        super
      end
    end

    def block_mermaid_svg(code)
      mmdc = "#{__dir__}/../../node_modules/.bin/mmdc"

      Dir.mktmpdir do |tmp|
        input_path = "#{tmp}/input"
        output_path = "#{tmp}/output.svg"

        File.open(input_path, "w") { |f| f.write(code) }
        ok = exec_with_timeout("#{mmdc} -i #{input_path} -o #{output_path} --theme neutral", 2)
        if ok && File.exist?(output_path)
          File.read(output_path)
        else
          "<pre>#{code}</pre>"
        end
      end
    end

  private

    def exec_with_timeout(cmd, timeout)
      pid = Process.spawn(cmd, { %i[err out] => :close, :pgroup => true })
      begin
        Timeout.timeout(timeout) do
          Process.waitpid(pid, 0)
          $?.exitstatus.zero?
        end
      rescue Timeout::Error
        Process.kill(15, -Process.getpgid(pid))
        false
      end
    end
  end
end
