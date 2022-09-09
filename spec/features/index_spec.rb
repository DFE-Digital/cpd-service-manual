# frozen_string_literal: true

require "feature_helper"

RSpec.feature "Index Page", type: :feature do
  scenario "is accessible" do
    given_i_am_on_the_index_page

    then_the_page_is_accessible
    and_a_snapshot_is_made_named "Index Page"
  end

  scenario "has not changed" do
    given_i_am_on_the_index_page

    then_the_page_has_not_changed_since_last_time "Index Page"
  end

  scenario "is displayed for the Root URL" do
    given_i_am_at_the_root_of_the_service

    then_i_am_on_the_index_page
  end
end
