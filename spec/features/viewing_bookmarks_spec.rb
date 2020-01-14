feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "https://www.google.co.uk/"
    expect(page).to have_content "https://www.bbc.co.uk/"
    expect(page).to have_content "https://uk.yahoo.com/?p=us&guccounter=1"
  end
end