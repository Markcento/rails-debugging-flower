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
  scenario "User creates a new flower with blank name" do
    visit "/flowers/new"

    fill_in "Name", :with => ""
    fill_in "Color", :with => "Blue"
    page.check 'edible'
    click_button "Save"

    expect(page).to have_text("There were some problems saving the form.")
  end

  let!(:family){ Family.create(name: 'Astor')}
  scenario "User creates a new flower with blank color" do
    visit "/flowers/new"

    fill_in "Name", :with => "Tulip"
    fill_in "Color", :with => ""
    page.check 'edible'
    click_button "Save"

    expect(page).to have_text("There were some problems saving the form.")
  end

  let!(:family){ Family.create(name: 'Astor')}
  scenario "User creates a new flower with a number in the name" do
    visit "/flowers/new"

    fill_in "Name", :with => "2lip"
    fill_in "Color", :with => "white"
    page.check 'edible'
    click_button "Save"

    expect(page).to have_text("Unable to create flower")
  end

  let!(:family){ Family.create(name: 'Astor')}
  scenario "User creates a new flower with a number in the color" do
    visit "/flowers/new"

    fill_in "Name", :with => "Tulip"
    fill_in "Color", :with => "gr33n"
    page.check 'edible'
    click_button "Save"

    expect(page).to have_text("Unable to create flower")
  end

  let!(:family){ Family.create(name: 'Astor')}
  scenario "User creates a new flower with a special character in the name" do
    visit "/flowers/new"

    fill_in "Name", :with => "d@fodil"
    fill_in "Color", :with => "yellow"
    page.check 'edible'
    click_button "Save"

    expect(page).to have_text("Unable to create flower")
  end

  let!(:family){ Family.create(name: 'Astor')}
  scenario "User creates a new flower with a special character in the color" do
    visit "/flowers/new"

    fill_in "Name", :with => "Tulip"
    fill_in "Color", :with => "or@nge"
    page.check 'edible'
    click_button "Save"

    expect(page).to have_text("Unable to create flower")
  end

end
