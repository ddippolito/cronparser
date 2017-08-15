require 'cron_task/mapping_generator'
require 'cron_task/time_lapse_interpreter'

describe CronTask::MappingGenerator do
  subject(:parser) { CronTask::MappingGenerator.new(task) }

  let(:task) { '*/15 0 1,15 * 1-5 /usr/bin/find' }
  let(:result) {
    [
      [0,15,30,45],
      [0],
      [1,15],
      [1,2,3,4,5,6,7,8,9,10,11,12],
      [1,2,3,4,5],
      ['/usr/bin/find']
    ]
  }

  it 'generates the array with the results' do
    expect(parser.call).to eq(result)
  end
end
