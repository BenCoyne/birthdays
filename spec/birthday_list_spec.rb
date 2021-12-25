require 'birthday_list'
require 'birthday'
require 'timecop'

describe BirthdayList do
  subject(:bday_list) { described_class.new }
  let(:friends_bday) { double(Birthday, {name: 'Phoebe Buffay', date: '16/02/1967'}) }
  let(:other_friends_bday) { double(Birthday, {name: 'Chandler Bing', date: '08/04/1968'}) }

  describe '#add_bday' do
    it 'adds a friends details to birthday list' do
      expect(bday_list.add_bday(friends_bday)).to contain_exactly(friends_bday)
    end

    it 'can add multiple instances of birthdays' do
      bday_list.add_bday(friends_bday)
      expect(bday_list.add_bday(other_friends_bday)).to contain_exactly(friends_bday, other_friends_bday)
    end
  end

  describe '#display_birthdays' do
    before do
      bday_list.add_bday(friends_bday)
      bday_list.add_bday(other_friends_bday)
    end

    it 'shows the user the stored friends, formatted on one line per friend' do
      expect{bday_list.display_birthdays}.to output("- Phoebe Buffay: 16/02/1967\n- Chandler Bing: 08/04/1968\n").to_stdout
    end
  end

  describe '#check_birthday' do
   before do
    bday_list.add_bday(friends_bday)
    bday_list.add_bday(other_friends_bday)
    end

    context 'when today is a stored friend\'s birthday' do
      Timecop.freeze(2021, 02, 16)
      it 'puts a string saying who\'s birthday it is and their age' do
        allow(friends_bday).to receive(:calculate_age).and_return(54)
        expect{bday_list.check_birthday}.to output("It's Phoebe Buffay's birthday today! They are 54 years old!\n").to_stdout
      end
    end

    context 'when today is not a stored friend\'s birthday' do
      new_list = BirthdayList.new()
      it 'does not puts anything' do
        expect(new_list.check_birthday).to be_nil
      end
    end
  end
end
