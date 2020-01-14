require 'bookmark'

describe Bookmark do 
  describe '.all' do
    it 'returns all bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include("https://www.google.co.uk/")
      expect(bookmarks).to include("https://www.bbc.co.uk/")
      expect(bookmarks).to include("https://uk.yahoo.com/?p=us&guccounter=1")
    end
  end
end