require 'date'

class Birthday

  attr_reader :name, :date

  def initialize(name, date)
    @name = name
    @date = date
  end

  def calculate_age
    today.year - Date.parse(date).year
  end

  private

  def today
    Date.today
  end

end