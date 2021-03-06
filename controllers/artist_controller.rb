require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/artist')
require_relative('../models/exhibit')


get '/artists' do
  @artists = Artist.all()
  erb (:'artists/index')
end

post '/artists' do
  Artist.new(params).save
  redirect '/artists'
end

#display a list of artists

get '/artists/new' do #create new artist
  @artist = Artist.all()
  erb(:'artists/new')
end

get '/artists/:id/edit' do # edit
  @artist = Artist.find( params[:id] )
  erb( :'artists/edit' )
end

get '/artists/:id' do # show
  @artist = Artist.find( params[:id] )
  erb( :'artists/show' )
end


post '/artists/:id/update' do # update
  Artist.new( params ).update
  redirect '/artists'
end

post '/artists/:id/delete' do # delete
  artist = Artist.find( params[:id] )
  artist.delete
  redirect '/artists'
end
