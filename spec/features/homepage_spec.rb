require 'rails_helper'

RSpec.describe 'Job Board Home', type: :feature do
  before(:each) do
    visit root_path
  end
  
  it 'should return a 200' do
    expect(page.status_code).to eq 200
  end
  
  it 'should have a home button' do
    expect(page).to have_text('Home', minimum: 1)
  end

  it 'should have an add jobs button' do
    expect(page).to have_text('Add Job', minimum: 1)
  end

  describe 'search' do
    it 'should filter search results based on the search' do
      j1 = Job.create(title: "Python", description: "abc")
      j2 = Job.create(title: "Rails", description: "dhh")

      visit root_path(search: "rails")

      expect(page).to have_text("Rails")
      expect(page).to_not have_text("Python")
    end
  end
 end
