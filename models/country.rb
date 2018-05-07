require_relative('../db/sql_runner')

class Country

attr_reader :name, :id

def initialize(options)
  @id = options['id'].to_i
  @name = options['name']
end

def save()
  sql = "INSERT INTO countries (name) VALUES ($1) RETURNING id"
  values = [@name]
  country_data = SqlRunner.run(sql, values)
  @id = country_data.first()['id'].to_i
end

# def update()
#   sql = "UPDATE cities
#   SET
#   (
#     name,
#     country_id
#     ) =
#     (
#       $1, $2
#     )
#     WHERE id = $3"
#     values = [@name, @country_id]
#     SqlRunner.run( sql, values )
#   end
#
#   def self.delete_all()
#     sql = "DELETE FROM cities;"
#     SqlRunner.run(sql)
#   end
#
#   def delete()
#     sql = "DELETE FROM cities;
#     WHERE id = $1"
#     values = [@id]
#     SqlRunner.run( sql, values )
#   end
#
#   def self.all()
#     sql = "SELECT * FROM cities;"
#     cities = SqlRunner.run( sql )
#     result = cities.map {|city| City.new(city)}
#     return result
#   end
#
#   def self.find(id)
#     sql = "SELECT * FROM cities WHERE id = $1"
#     values = [id]
#     city = SqlRunner.run(sql, values)
#     result = City.new(city.first)
#     return result

  end
