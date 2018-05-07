require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/city.rb' )

get '/city' do
 @cities = City.all()
 erb (:"city/index")
end

get '/city/:id' do
 @city = City.find(params['id'].to_i)
 erb(:"city/show")
end

# CREATE travel
get '/city/new' do
  erb(:new)
end
