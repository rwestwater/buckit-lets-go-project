require_relative('../db/sql_runner')

class Visit

  attr_reader :id, :city_id, :going_date, :return_date, :review

  def initialize(options)
    @id = options['id'].to_i
    @city_id = options['city_id'].to_i
    @going_date = options['going_date']
    @return_date = options['return_date']
    @review = options['review']
  end

#INSTANCE METHODS
  def save()
    sql = "INSERT INTO visits
    (
      city_id,
      going_date,
      return_date,
      review
    )
    VALUES
    (
      $1,
      $2,
      $3,
      $4
    )
    RETURNING id"
    values = [@city_id, @going_date, @return_date, @review]
    visit_data = SqlRunner.run(sql, values)
    @id = visit_data.first()['id'].to_i
  end

  def update()
    sql = "UPDATE visits SET review = $1, going_date = $2, return_date = $3 WHERE id = $4"
    values = [@review, @going_date, @return_date, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM visits WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def city()
    sql = "SELECT * FROM cities WHERE id = $1"
    values = [@city_id]
    result = SqlRunner.run(sql, values).first()
    return City.new(result)
  end

  def country()
    country_id = self.city.country_id
    sql = "SELECT * FROM countries WHERE id = $1"
    values = [country_id]
    result = SqlRunner.run(sql, values)
    return Country.new(result.first)
  end

  #CLASS METHOD
  def self.delete_all()
    sql = "DELETE FROM visits"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM visits"
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
