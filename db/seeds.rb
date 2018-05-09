require_relative( "../models/city.rb" )
require_relative( "../models/country.rb" )
require_relative( "../models/visit.rb" )
require('pry')

Visit.delete_all()
City.delete_all()
Country.delete_all()

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

#VISITS

visit1 = Visit.new({
  "country_id" => country1.id,
  "city_id" => city1.id,
  "going_date" => "2016-09-01",
  "return_date" => "2016-09-08",
  "review" => "Would go back again, haggis is awesome"
  })
visit1.save()

visit2 = Visit.new({
  "country_id" => country2.id,
  "city_id" => city2.id,
  "going_date" => "2017-11-25",
  "return_date" => "2017-12-01",
  "review" => "Malaga city is great for food"
  })
visit2.save()

visit3 = Visit.new({
  "country_id" => country3.id,
  "city_id" => city3.id,
  "going_date" => "2017-08-30",
  "return_date" => "2017-09-30",
  "review" => "N/A"
  })
visit3.save()


binding.pry
nil
