require 'bookmark'

describe Bookmark do 
  describe '.all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      # Add the test data
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.google.co.uk/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://www.bbc.co.uk/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('https://uk.yahoo.com/?p=us&guccounter=1');")

      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://www.google.co.uk/")
      expect(bookmarks).to include("https://www.bbc.co.uk/")
      expect(bookmarks).to include("https://uk.yahoo.com/?p=us&guccounter=1")
    end
  end
end