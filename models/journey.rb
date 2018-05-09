class Journey

  attr_reader :id, :city_name, :country_name, :going_date, :return_date, :review

  def initialize(params)
    @city_name = params['city_name']
    @country_name = params['country_name']
    @going_date = params['going_date']
    @return_date = params['return_date']
    @review = params['review']
  end

  def delete()
    sql = "DELETE FROM "
    values = [@id]
    SqlRunner.run( sql, values )
  end

end
