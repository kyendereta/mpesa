Given("I am on the signup page") do
    visit 'users/new'
  end
  
  Then("I should see {string}") do |string|
    expect(page).to have_content string
  end
  
  Then("I should see {string} button") do |string|
    expect(page).to have_button string
  end
  
  When("I fill in {string} with {string}") do |string, string2|
    fill_in string, with: string2
  end
  
  When("I click Create Account") do
    click_button ('Create Account')
  end

  Then("I shoud be redirect to show page") do
    user = User.find_by(id_number: '12345678')
    user_id = user.id
    visit "/users/#{user_id}"
  end
  
  Given("User with phone_number {string} exists") do |string|
    FactoryBot.create(:user, phone_number: string)
  end
  
  Given("User with id_number {string} exists") do |string|
    FactoryBot.create(:user, id_number: string)
  end
  