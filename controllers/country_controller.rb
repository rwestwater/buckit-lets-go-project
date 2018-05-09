require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/country')

# READ FUNCTIONS
get '/country' do
  @countries = Country.all()
  erb (:'country/index')
end

get '/country/new' do
  erb(:'country/new')
end

get '/country/:id' do
  @country = Country.find(params['id'].to_i)
  erb(:'country/show')
end

#CREATE FUNCTIONS
post '/country/new' do
  @country = Country.new(params)
  @country.save()
  redirect ('/country')
end

#UPDATE FUNCTIONS
get '/country/:id/edit' do
  @country = Country.find(params[:id])
  erb(:'/country/edit')
end

post '/country/:id/update' do
  @country = Country.new(params)
  @country.update()
  redirect('/country')
end

#DELETE FUNCTIONS
post '/country/:id/delete' do
  @country = Country.find(params[:id])
  @country.delete()
  redirect ('/country')
end
