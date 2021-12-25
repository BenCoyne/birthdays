require 'birthday_list'
require 'timecop'

describe BirthdayList do
  subject(:bday_list) { described_class.new }

  describe '#add_friend' do
    it 'adds a friends details to birthday list' do
      expect(bday_list.add_friend('Phoebe Buffay', '16/02/1967')).to eq([{name: 'Phoebe Buffay', birthday: '16/02/1967'}])
    end
  end

  describe '#display_birthdays' do
    before do
      bday_list.add_friend('Phoebe Buffay', '16/02/1967')
      bday_list.add_friend('Chandler Bing', '08/04/1968')
    end

    it 'shows the user the stored friends, formatted on one line per friend' do
      expect{bday_list.display_birthdays}.to output("- Phoebe Buffay: 16/02/1967\n- Chandler Bing: 08/04/1968\n").to_stdout
    end
  end

  describe '#birthdays_today' do
   before do
      bday_list.add_friend('Phoebe Buffay', '16/02/1967')
      bday_list.add_friend('Chandler Bing', '08/04/1968')
    end

    context 'when today is a stored friend\'s birthday' do
      Timecop.freeze(2021, 02, 16)
      it 'puts a string saying who\'s birthday it is and their age' do
        expect{bday_list.birthdays_today}.to output("It's Phoebe Buffay's birthday today! They are 54 years old!\n").to_stdout
      end
    end

    context 'when today is not a stored friend\'s birthday' do
      new_list = BirthdayList.new()
      it 'does not puts anything' do
        expect(new_list.birthdays_today).to be_nil
      end
    end
  end
end
