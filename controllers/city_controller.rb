require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )

#READ FUNCTIONS
get '/city' do
 @cities = City.all()
 erb (:'city/index')
end

get '/city/new' do
  @countries = Country.all
  erb(:'city/new')
end

get '/city/:id' do
 @city = City.find(params['id'].to_i)
 erb(:'city/show')
end

#CREATE FUNCTION
post '/city/new' do
  @city = City.new(params)
  @city.save()
  redirect ('/city')
end

#UPDATE FUNCTIONS
get '/city/:id/edit' do
  @countries = Country.all
  @city = City.find(params[:id])
  erb(:'/city/edit')
end

post '/city/:id/update' do
  @city = City.new(params)
  @city.update()
  redirect('/city')
end

#DELETE FUNCTIONS
post '/city/:id/delete' do
  @city = City.find(params[:id])
  @city.delete()
  redirect ('/city')
end
