require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/country')

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

post '/country/new' do
  @country = Country.new(params)
  @country.save()
  redirect to ('/country')
end

post '/country/:id/delete' do
  @country = Country.find(params[:id])
  @country.delete()
  redirect to ('/country')
end
