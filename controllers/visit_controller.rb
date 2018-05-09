require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/visit.rb' )

get '/visit' do
  @visit = Visit.all()
  erb (:"visit/index")
end

get '/visit/new' do
  @countries = Country.all
  @cities = City.all
  erb(:"visit/new")
end

get '/visit/:id' do
  @visit = Visit.find(params['id'].to_i)
  erb(:"visit/show")
end

post '/visit/new' do
  @visit = Visit.new(params)
  @visit.save()
  redirect to (:"/visit")
end
