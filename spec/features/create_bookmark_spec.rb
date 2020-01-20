require 'pg'

feature "Create bookmark" do
  scenario "So the user can add a bookmark" do

    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/add')
    fill_in 'url', with: 'www.facebook.com'
    fill_in 'title', with: 'Facebook Bookmark'
    click_button 'Submit'

    expect(page).to have_link('Facebook Bookmark', href: 'www.facebook.com')

  end
end