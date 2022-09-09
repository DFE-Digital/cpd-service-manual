# frozen_string_literal: true

module AxeAndScreenshotHelper
  extend RSpec::Matchers::DSL

  def and_the_page_is_accessible
    expect(page).to be_axe_clean.according_to :wcag2a, :section508
  end
  alias_method :then_the_page_is_accessible, :and_the_page_is_accessible

  def and_a_snapshot_is_made_named(name_of_screenshot)
    screenshot name_of_screenshot
  end
  alias_method :then_a_snapshot_is_made_named, :and_a_snapshot_is_made_named

  def and_the_page_has_not_changed_since_last_time(name_of_snapshot)
    check_page name_of_snapshot
  end
  alias_method :then_the_page_has_not_changed_since_last_time, :and_the_page_has_not_changed_since_last_time
end
