require '/Users/bencoyne/Projects/birthdays/birthdays/lib/birthday_list.rb'

describe BirthdayList do
  subject(:bday_list) { described_class.new }

  describe '#add_friend' do
    it 'adds a friend\'s details to birthday list' do
      expect(bday_list.add_friend('Phoebe Buffay', '16 February 1967')).to eq([{name: 'Phoebe Buffay', birthday: '16 February 1967'}])
    end
  end

  describe '#display_birthdays' do
    before do
      bday_list.add_friend('Phoebe Buffay', '16 February 1967')
      bday_list.add_friend('Chandler Bing', '08 April 1968')
    end

    it 'shows the user the stored friends, formatted on one line per friend' do
      expect{bday_list.display_birthdays}.to output("- Phoebe Buffay: 16 February 1967\n- Chandler Bing: 08 April 1968\n").to_stdout
    end
  end
end


# Check whose birthday it is today - the program can check through 
# the birthdays I have stored and check each one to see if it’s 
# someone’s birthday, and tells me something like 
# "It's Mary Poppin's birthday today! They are 124 years old!" 
# - otherwise it won't say anything.
