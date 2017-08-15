require 'cron_task/time_lapse_interpreter'

describe CronTask::TimeLapseInterpreter do
  it 'returns the number' do
    field = '0'
    interval = (0..59)

    expect(described_class.call(interval, field)).to eq([0])
  end

  it 'returns the frequency in comma separated interval' do
    field = '1,5'
    interval = (0..59)

    expect(described_class.call(interval, field)).to eq([1,5])
  end

  it 'returns the frequency in comma separated interval' do
    field = '1,5,10'
    interval = (0..59)

    expect(described_class.call(interval, field)).to eq([1,5,10])
  end

  it 'returns the frequency in comma separated interval' do
    field = '*'
    interval = (0..10)

    expect(described_class.call(interval, field)).to eq([0,1,2,3,4,5,6,7,8,9,10])
  end

  it 'returns the frequency in comma separated interval' do
    field = '*'
    interval = (0..10)

    expect(described_class.call(interval, field)).to eq([0,1,2,3,4,5,6,7,8,9,10])
  end

  it 'returns the frequency in comma separated interval' do
    field = '3-8'
    interval = (0..10)

    expect(described_class.call(interval, field)).to eq([3,4,5,6,7,8])
  end

  it 'returns the frequency in comma separated interval' do
    field = '*/2'
    interval = (0..9)

    expect(described_class.call(interval, field)).to eq([0,2,4,6,8])
  end

  it 'returns the frequency in comma separated interval' do
    field = '1-20/5'
    interval = (0..30)

    expect(described_class.call(interval, field)).to eq([5,10,15,20])
  end

end
