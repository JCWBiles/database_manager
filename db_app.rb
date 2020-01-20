require 'sinatra/base'
require './lib/bookmark'
require 'pg'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :index
  end

  get '/view_bookmarks' do
    # p ENV
    @bookmarks = Bookmark.all
    erb :view_bookmarks
  end

  get '/add' do
    erb :add
  end

  post '/view_bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/view_bookmarks'
  end
  
  run! if app_file == $0
end