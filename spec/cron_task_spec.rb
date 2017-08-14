require 'cron_parser'

describe CronParser do
  let(:cronjob) { '*/10 1-5 1,6 10 * bin/do_something  '}
  let(:expected_output) do
<<-HEREDOC
HEREDOC
  end

  it 'outputs the explained cron task' do
    expect(CronParser.explain(cronjob)).to eq('')
  end

  context 'invalid input' do
    let(:cronjob) { '* * not right'}

    let(:error_message) do
<<-HEREDOC
Invalid cron task
Please provide a valid cron task

Usage:
bin/cronparse * * * * * bin/do_something
HEREDOC
    end

    it 'fails and print to the an error message to the user' do
      expect{ CronParser.explain(cronjob) }.
        to output(error_message).to_stdout
    end
  end
end
