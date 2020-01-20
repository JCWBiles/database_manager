require 'pg'

feature "So a user can create bookmark" do
  scenario "so the user can add the bookmark into the database" do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/add')
    fill_in 'adding_link', with: 'www.facebook.com'
    click_button 'Submit'
    expect(page).to have_content 'www.facebook.com'

  end
end