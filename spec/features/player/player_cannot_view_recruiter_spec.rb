require 'rails_helper'

RSpec.feature "player" do
  scenario "cannot view recruiter profile" do
    player = create(:player, type: "Player")
    recruiter = create(:recruiter, :with_profile, email: "nicksaban@crimson.ua.edu")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(player)

    visit recruiter_profile_path(recruiter.profile.id)

    expect(current_path).to eq login_path
  end
end
