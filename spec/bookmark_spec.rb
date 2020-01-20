require 'bookmark'
require 'database_helpers'

describe Bookmark do 
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      bookmark = Bookmark.create(url: "https://www.google.co.uk/", title: "Google")
      Bookmark.create(url: "https://www.bbc.co.uk/", title: "BBC")
      Bookmark.create(url: "https://uk.yahoo.com/?p=us&guccounter=1", title: "Yahoo")

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'https://www.google.co.uk/'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'www.facebook.com', title: 'Facebook Bookmark')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Facebook Bookmark'
      expect(bookmark.url).to eq 'www.facebook.com'
    end
  end


end