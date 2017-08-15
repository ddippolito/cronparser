require 'cron_task'

describe CronTask do
  let(:cronjob) { '*/10 1-5 1,6 10 * bin/do_something' }
  let(:expected_output) do
<<-HEREDOC
 minute        0 10 20 30 40 50
 hour          1 2 3 4 5
 day of month  1 6
 month         10
 day of week   0 1 2 3 4 5 6
 command       bin/do_something
HEREDOC
  end

  it 'outputs the explained cron task' do
    expect{ CronTask.explain(cronjob) }.
      to output(expected_output).to_stdout
  end

  context 'invalid input' do
    let(:cronjob) { '* * not right' }

    let(:error_message) do
<<-HEREDOC
Invalid cron task
Please provide a valid cron task in a string

Usage:
bin/cronparse "* * * * * bin/do_something"
HEREDOC
    end

    it 'fails and print to the an error message to the user' do
      expect { CronTask.explain(cronjob) }.
        to output(error_message).to_stdout
    end
  end
end
