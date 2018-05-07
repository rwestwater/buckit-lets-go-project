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
