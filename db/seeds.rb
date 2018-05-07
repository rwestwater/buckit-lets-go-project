require_relative( "../models/city.rb" )
require_relative( "../models/country.rb" )
require_relative( "../models/visit.rb" )

country1 = Country.new({"name" => "Scotland"})
country1.save()
country2 = Country.new({"name" => "Spain"})
country2.save()
country3 = Country.new({"name" => "Italy"})
country3.save()

city1 = City.new({
  "name" => "Edinburgh",
  "country_id" => country1.id
  })
  city1.save()
city2 = City.new({
  "name" => "Malaga",
  "country_id" => country2.id
  })
  city2.save()
city3 = City.new({
  "name" => "Rome",
  "country_id" => country3.id
  })
city3.save()
