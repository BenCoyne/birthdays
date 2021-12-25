require 'birthday'

describe Birthday do
  subject(:birthday) { described_class.new(name, date) }
  let(:name) { 'Rachel Green' }
  let(:date) { '5/5/1969' }
  
  it "stores a friends name" do
    expect(birthday.name).to eq('Rachel Green')
  end

  it "stores a friends birthday" do
    expect(birthday.date).to eq('5/5/1969')
  end

  describe '#calculate_age' do
    it "can calculate a friends age" do
      expect(birthday.calculate_age).to eq(52)
    end
  end
end