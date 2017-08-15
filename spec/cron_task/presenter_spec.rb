require 'cron_task/presenter'

describe CronTask::Presenter do
  subject(:presenter) { CronTask::Presenter.new(field_values) }

  let(:field_values) {
    [
      [0,15,30,45],
      [0],
      [1,15],
      [1,2,3,4,5,6,7,8,9,10,11,12],
      [1,2,3,4,5],
      ['do something nice']
    ]
  }

  let(:table) do
<<-TABLE
 minute        0 15 30 45
 hour          0
 day of month  1 15
 month         1 2 3 4 5 6 7 8 9 10 11 12
 day of week   1 2 3 4 5
 command       do something nice
TABLE
  end

  it 'builds the output table' do
    expect(presenter.to_s + "\n").to eq(table)
  end
end
