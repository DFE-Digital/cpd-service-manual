# frozen_string_literal: true

require "feature_helper"

RSpec.feature "Accessibility Page", type: :feature do
  scenario "is accessible" do
    given_i_am_on_the_accessibility_page

    then_the_page_is_accessible
    and_a_snapshot_is_made_named "Accessibility Page"
  end

  scenario "has not changed" do
    given_i_am_on_the_accessibility_page

    then_the_page_has_not_changed_since_last_time "Accessibility Page"
  end
end
