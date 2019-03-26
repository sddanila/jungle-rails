require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(first_name: "Mazli", 
                        last_name: "Barton", 
                        email: "mazli@mazli.com", 
                        password: "mazli", 
                        password_confirmation: "mazli")
  end  
  scenario "user can login and once logged in is redirected to the home page" do
    # ACT
    puts @user.email
    puts @user.password
    visit login_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button('Login')


    # DEBUG
    save_screenshot

    # VERIFY
    navbar = find(:css, '.navbar')
    expect(navbar).to have_text 'Logout', count: 1

  end
end
