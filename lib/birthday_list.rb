require 'date'
require 'birthday'

class BirthdayList

  def initialize
    @birthday_list = []
  end
  
  def add_bday(birthday)
    @birthday_list << birthday
  end

  def display_birthdays
    @birthday_list.each do |friend| 
      puts "- #{friend.name}: #{friend.date}"
    end
  end

  def check_birthday
    @birthday_list.each do |friend| 
      puts "It's #{friend.name}'s birthday today! They are #{friend.calculate_age} years old!" if today?(friend)
    end
    return 
  end

  private

  def today
    Date.today
  end

  def bday_formatter(friend)
    friend.date[0..5]
  end
  
  def today?(friend)
    today.strftime('%d/%m/') == bday_formatter(friend)
  end
end
