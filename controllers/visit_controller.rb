require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/visit.rb')

get '/visit' do
 @visits = Visit.all()
 erb (:"visit/index")
end

get '/visit/:id' do
 @visit = Visit.find(params['id'].to_i)
 erb(:"visit/show")
end

# CREATE travel
get '/visit/new' do
  erb(:"visit/new")
end

post'/visit/new' do
  @visit= Visit.new()
  @visit.save()
end
