class Parser
  def initialize(cronjob)
    @cronjob = cronjob
  end

  def call
    elements
  end

  def minutes
    decompose(all_minutes, minutes_part)
  end

  def hours
    decompose(all_hours, hours_part)
  end

  def days_of_month
    decompose(all_days_of_the_month, day_of_month_part)
  end

  def months
    decompose(all_months, month_part)
  end

  def days_of_week
    decompose(all_days_of_week, weekday_part)
  end

  private

  def decompose(interval, cron_section)
    if cron_section == '*'
      interval
    elsif cron_section.include?(',')
      cron_section.split(',').map(&:to_i)
    elsif cron_section.include?('-')
      a, b = cron_section.split('-').map(&:to_i)
      interval.to_a[a,b]
    elsif cron_section.include?('/')
      a, b = cron_section.split('/')
      if a == '*'
        interval.step(b.to_i).to_a
      else
        c,d = a.split('-').map(&:to_i)
        interval.to_a[c,d].step(b).to_a
      end
    else
        [0]
    end
  end

  def elements
    @cronjob.split
  end

  def command
    elements.last #consider pop
  end

  def intervals
    elements[0...-1]
  end

  def minutes_part
    intervals[0]
  end

  def hours_part
    intervals[1]
  end

  def day_of_month_part
    intervals[2]
  end

  def month_part
    intervals[3]
  end

  def weekday_part
    intervals[4]
  end

  def all_minutes
    (0..59)
  end

  def all_hours
    (0..23).to_a
  end

  def all_days_of_the_month
    (1..31).to_a
  end

  def all_months
    (1..12).to_a
  end

  def all_days_of_week
    (0..6)
  end
end
