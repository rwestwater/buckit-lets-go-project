require_relative( "../models/city.rb" )
require_relative( "../models/country.rb" )
require_relative( "../models/visit.rb" )

Country.delete_all()

country1 = Country.new({"name" => "Scotland"})
country1.save()
country2 = Country.new({"name" => "Spain"})
country2.save()
country3 = Country.new({"name" => "Italy"})
country3.save()

city1 = City.new({
  "name" => "Edinburgh"
  })
  city1.save()
city2 = City.new({
  "name" => "Malaga"
  })
  city2.save()
city3 = City.new({
  "name" => "Rome"
  })
city3.save()

#VISITS

visit1 = Visit.new({
  "country_id" => country1.id,
  "city_id" => city1.id,
  "going_date" => "17/08/2018"
  "return_date" => "02/09/2018"
  "review" => "Would go back again, haggis is awesome"
  })
visit1.save()

visit2 = Visit.new({
  "country_id" => country2.id,
  "city_id" => city2.id,
  "going_date" => "25/11/2018"
  "return_date" => "30/11/2018"
  "review" => "Malaga city is great for food"
  })
visit2.save()

visit3 = Visit.new({
  "country_id" => country3.id,
  "city_id" => city3.id
  "going_date" => "30/07/2019",
  "return_date" => "30/08/2019",
  "review" => "N/A"
  })
visit3.save()
