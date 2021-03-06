require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/exhibit')
require_relative('../models/artist')


get '/exhibits' do
  @exhibits = Exhibit.all()
  erb (:'exhibits/index')
end


post '/exhibits' do
  Exhibit.new(params).save
  redirect '/exhibits'
end

get '/exhibits/new' do #create new exhibit/ assign artist to exhibits
  @exhibits = Exhibit.all()
  @artists = Artist.all()
  erb(:'exhibits/new')
end


post '/exhibits/:id/assignment' do
  @artist = Artist.all()
  @exhibit = (params[:id])
  erb(:assigment)
end

get '/exhibits/:id/edit' do # edit
  @exhibit = Exhibit.find( params[:id] )
    @artists = Artist.all()
  erb( :'exhibits/edit' )
end


post '/exhibits/:id/edit' do # update
  Exhibit.new( params ).update
  redirect '/exhibits'
end

get '/exhibits/:id' do # show
  @exhibit = Exhibit.find( params[:id] )
  erb( :'exhibits/show' )
end


post '/exhibits/:id/delete' do # delete
  exhibit = Exhibit.find( params[:id] )
  exhibit.delete
  redirect '/exhibits'
end
