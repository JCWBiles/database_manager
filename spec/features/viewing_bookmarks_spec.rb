require 'pg'

feature 'Viewing bookmarks' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Bookmark Manager"
  end
end

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    Bookmark.create(url: "https://www.google.co.uk/", title: "Google")
    Bookmark.create(url: "https://www.bbc.co.uk/", title: "BBC")
    Bookmark.create(url: "https://uk.yahoo.com/?p=us&guccounter=1", title: "Yahoo")

    visit('/view_bookmarks')

    expect(page).to have_link('Google', href: "https://www.google.co.uk/")
    expect(page).to have_link('BBC', href: "https://www.bbc.co.uk/")
    expect(page).to have_link('Yahoo', href: "https://uk.yahoo.com/?p=us&guccounter=1")
  end
end