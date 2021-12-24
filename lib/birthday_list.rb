class BirthdayList

  def initialize
    @birthday_list = []
  end

  def add_friend(name, birthday)
    @birthday_list << {name: name, birthday: birthday}
  end

  def display_birthdays
    @birthday_list.each do |friend| 
      puts "- #{friend[:name]}: #{friend[:birthday]}"
    end
  end
  
end

# list = BirthdayList.new
# list.add_friend('Phoebe Buffay', '16 February 1967')
# list.add_friend('Chandler Bing', '08 April 1968')

# list.display_birthdays