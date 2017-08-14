require 'cron_parser/time_lapse_mapper'

describe TimeLapseMapper do
  it 'returns the number' do
    field = '0'
    values = (0..59)

    expect(TimeLapseMapper.call(field, values)).to eq([0])
  end

  it 'returns the frequency in comma separated values' do
    field = '1,5'
    values = (0..59)

    expect(TimeLapseMapper.call(field, values)).to eq([1,5])
  end

  it 'returns the frequency in comma separated values' do
    field = '1,5,10'
    values = (0..59)

    expect(TimeLapseMapper.call(field, values)).to eq([1,5,10])
  end

  it 'returns the frequency in comma separated values' do
    field = '*'
    values = (0..10)

    expect(TimeLapseMapper.call(field, values)).to eq([0,1,2,3,4,5,6,7,8,9,10])
  end

  it 'returns the frequency in comma separated values' do
    field = '*'
    values = (0..10)

    expect(TimeLapseMapper.call(field, values)).to eq([0,1,2,3,4,5,6,7,8,9,10])
  end

  it 'returns the frequency in comma separated values' do
    field = '1-5'
    values = (0..10)

    expect(TimeLapseMapper.call(field, values)).to eq([1,2,3,4,5])
  end

  it 'returns the frequency in comma separated values' do
    field = '*/2'
    values = (0..9)

    expect(TimeLapseMapper.call(field, values)).to eq([0,2,4,6,8])
  end

  it 'returns the frequency in comma separated values' do
    field = '1-20/5'
    values = (0..30)

    expect(TimeLapseMapper.call(field, values)).to eq([5,10,15,20])
  end

end
