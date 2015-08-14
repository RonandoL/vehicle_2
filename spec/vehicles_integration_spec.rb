  # Make sure your integration tests cover all of the ways
  #a user can navigate through your pages!

require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the vehicle path', {:type => :feature}) do
  it('goes from home page to vehicles page') do
    visit('/')
    click_link('See Dealership List')
    expect(page).to have_content('All our vehicles')
  end
end



    # visit('/')
    # click_link('View all our Vehicles')
    # fill_in('first_name', :with => 'Joe')
    # fill_in('last_name', :with => 'Blow')
    # fill_in('job_title', :with => 'ABC')
    # fill_in('company', :with => 'Assassin')
    # click_button('Add yo contact ya! Bitch!')
    # click_link("go to your contact page")
    # expect(page).to have_content('Joe Blow')
