require 'date'
require 'birthday'

class BirthdayList

  def initialize
    @birthday_list = []
  end

  def add_friend(name, date)
    @birthday_list << {name: name, birthday: date}
  end

  def display_birthdays
    @birthday_list.each do |friend| 
      puts "- #{friend[:name]}: #{friend[:birthday]}"
    end
  end

  def birthdays_today
    @birthday_list.each do |friend| 
      puts "It's #{friend[:name]}'s birthday today! They are #{calculate_age(friend)} years old!" if today?(friend)
    end
    return 
  end

  private

  def today
    Date.today
  end

  def bday_formatter(friend)
    friend[:birthday][0..5]
  end
  
  def year_formatter(friend)
    friend[:birthday][6..].to_i
  end
  
  def today?(friend)
    today.strftime('%d/%m/') == bday_formatter(friend)
  end

  def calculate_age(friend)
    today.year - year_formatter(friend)
  end
end
