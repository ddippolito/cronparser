require 'cron_task/mapping_generator'
require 'cron_task/presenter'
require 'cron_task/time_lapse_interpreter'

module CronTask

  def self.explain(crontask)
    if crontask =~ cron_job_regexp
      mapping = MappingGenerator.new(crontask).call
      puts Presenter.new(mapping)
    else
      print error_message
    end
  end

  private

  def self.error_message
<<-HEREDOC
Invalid cron task
Please provide a valid cron task

Usage:
bin/cronparse * * * * * bin/do_something
HEREDOC
  end

  def self.cron_job_regexp
    /([^\s]+)\s([^\s]+)\s([^\s]+)\s([^\s]+)\s([^\s]+)\s([^#\n$]*)(\s#\s([^\n$]*)|$)/
  end
end
