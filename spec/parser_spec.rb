require 'parser'

describe Parser do
  subject(:parser) { Parser.new(crontab) }

  let(:crontab) { '*/15 0 1,15 * 1-5 /usr/bin/find' }
  let(:components) { ['*/15', '0', '1,15', '*', '1-5', '/usr/bin/find']}

  it 'separetes the components of the the cron string' do
    expect(parser.call).to eq(components)
  end

  it 'finds the minute array' do
    expect(parser.minutes).to eq([0,15,30,45])
  end

  it 'finds the hour array' do
    expect(parser.hours).to eq([0])
  end

  it 'finds the day of the month array' do
    expect(parser.days_of_month).to eq([1,15])
  end

  it 'finds the day of the month array' do
    expect(parser.months).to eq([1,2,3,4,5,6,7,8,9,10,11,12])
  end

  it 'finds the day of the week array' do
    expect(parser.days_of_week).to eq([1,2,3,4,5])
  end
end

#dictionary of symbols to compose functions:
#example - means explode 1-5 into range 1 2 3 4 5
#example / steps
#example , means only 1,5 into 1 5
#example * all 1 2 3 4 5 6 7 ....
#
#
#return a hash a structure with
#minutes: 10 11 12
#days: 1 2 3 
#month: 1 3 
#day_of_month: 12 13 14 
#
#
#could have a builder for every field
#
#could have  a class or a method for every rule with same interface
#apply? etc etc
