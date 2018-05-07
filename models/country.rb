require_relative('../db/sql_runner')

class Country

attr_reader :id
attr_writer :name

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

def update()
  sql = "UPDATE countries SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM countries;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM countries;
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM countries;"
    countries = SqlRunner.run( sql )
    result = countries.map {|country| Country.new(country)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM country WHERE id = $1"
    values = [id]
    country = SqlRunner.run(sql, values)
    result = Country.new(country.first)
    return result

  end
