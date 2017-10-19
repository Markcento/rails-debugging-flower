require "rails_helper"

RSpec.feature "Create a flower", :type => :feature do
  let!(:family){ Family.create(name: 'Astor')}
  scenario "User creates a new flower" do
    visit "/flowers/new"

    fill_in "Name", :with => "Tulip"
    fill_in "Color", :with => "Blue"
    page.check 'edible'
    click_button "Save"

    expect(page).to have_text("Flower was successfully created.")
  end

  let!(:family){ Family.create(name: 'Astor')}
  scenario "User creates a new flower" do
    visit "/flowers/new"

    fill_in "Name", :with => ""
    fill_in "Color", :with => "Blue"
    page.check 'edible'
    click_button "Save"

    expect(page).to have_text("There were some problems saving the form.")
  end

  let!(:family){ Family.create(name: 'Astor')}
  scenario "User creates a new flower" do
    visit "/flowers/new"

    fill_in "Name", :with => "Tulip"
    fill_in "Color", :with => ""
    page.check 'edible'
    click_button "Save"

    expect(page).to have_text("There were some problems saving the form.")
  end

end
