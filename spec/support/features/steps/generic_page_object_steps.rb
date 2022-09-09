# frozen_string_literal: true

module Steps
  module GenericPageObjectSteps
    include RSpec::Matchers

    def given_i_am_at_the_root_of_the_service
      visit "/"
    end

    Pages.constants.each do |page_object_name|
      next if page_object_name == :BasePage

      page_object = Pages.const_get(page_object_name)

      define_method("given_i_am_on_the_#{page_object_name.to_s.underscore}") do |*args|
        generic_call page_object, :load, *args
      end

      define_method("given_i_am_on_the_#{page_object_name.to_s.underscore}_with") do |*args|
        generic_call page_object, :load, *args
      end

      define_method("when_i_am_on_the_#{page_object_name.to_s.underscore}") do |*args|
        generic_call page_object, :load, *args
      end

      define_method("when_i_am_on_the_#{page_object_name.to_s.underscore}_with") do |*args|
        generic_call page_object, :load, *args
      end

      define_method("then_i_am_on_the_#{page_object_name.to_s.underscore}") do |*args|
        generic_call page_object, :loaded, *args
      end

      define_method("then_i_am_on_the_#{page_object_name.to_s.underscore}_with") do |*args|
        generic_call page_object, :loaded, *args
      end

      define_method("and_i_am_on_the_#{page_object_name.to_s.underscore}") do |*args|
        generic_call page_object, :loaded, *args
      end

      define_method("and_i_am_on_the_#{page_object_name.to_s.underscore}_with") do |*args|
        generic_call page_object, :loaded, *args
      end

      page_object.instance_methods.each do |method_name|
        define_method("given_i_#{method_name}_on_the_#{page_object_name.to_s.underscore}") do |*args|
          generic_call page_object.new, method_name, *args
        end

        define_method("given_i_#{method_name}_on_the_#{page_object_name.to_s.underscore}_with") do |*args|
          generic_call page_object.new, method_name, *args
        end

        define_method("when_i_#{method_name}_on_the_#{page_object_name.to_s.underscore}") do |*args|
          generic_call page_object.new, method_name, *args
        end

        define_method("when_i_#{method_name}_on_the_#{page_object_name.to_s.underscore}_with") do |*args|
          generic_call page_object.new, method_name, *args
        end

        define_method("then_i_#{method_name}_on_the_#{page_object_name.to_s.underscore}") do |*args|
          generic_call page_object.new, method_name, *args
        end

        define_method("then_i_#{method_name}_on_the_#{page_object_name.to_s.underscore}_with") do |*args|
          generic_call page_object.new, method_name, *args
        end

        define_method("and_i_#{method_name}_on_the_#{page_object_name.to_s.underscore}") do |*args|
          generic_call page_object.new, method_name, *args
        end

        define_method("and_i_#{method_name}_on_the_#{page_object_name.to_s.underscore}_with") do |*args|
          generic_call page_object.new, method_name, *args
        end
      end
    end

  private

    def generic_call(page_object, method_symbol, *args)
      page_object.public_send method_symbol, *args
    end
  end
end
