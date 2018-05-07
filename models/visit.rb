require_relative('../db/sql_runner')

class Visit

attr_reader :id, :country_id, :city_id, :going_date, :return_date, :review

def initialize(options)
  @id = options['id'].to_i
  @city_id = options['city_id'].to_i
  @country_id = options['country_id'].to_i
  @going_date = options['going_date'].to_i
  @return_date = options['return_date'].to_i
  @review = options['review']
end

def save()
  sql = "INSERT INTO visits(
  city_id,
  country_id,
  going_date,
  return_date,
  review
  )
  VALUES (
    $1,
    $2,
    $3,
    $4,
    $5
  )
  RETURNING id"
  values = [@city_id, @country_id, @going_date, @return_date, @review]
  visit_data = SqlRunner.run(sql, values)
  @id = visit_data.first()['id'].to_i
end

def update()
  sql = "UPDATE countries SET (name) = ($1) WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM visits;"
    SqlRunner.run(sql)
  end

  def delete()
    sql = "DELETE FROM visits;
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM visits;"
    visits = SqlRunner.run(sql)
    result = visits.map {|visit| Visit.new(visit)}
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM visits WHERE id = $1"
    values = [id]
    visit = SqlRunner.run(sql, values)
    result = Visit.new(visit.first)
    return result

  end
end
