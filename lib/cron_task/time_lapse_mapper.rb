class TimeLapseMapper
  def self.call(field, lapse)
    new(field, lapse).call
  end

  def initialize(field, lapse)
    @field = field
    @lapse = lapse
  end

  def call
    expanded_set.map(&:to_i)
  end

  private
  attr_reader :lapse, :field

  def expanded_set
    if field == '*'
      every_unit_field
    elsif field.include?('/')
      step_field
    elsif field.include?('-')
      range_field
    else
      field.split(',')
    end
  end

  def step_field
    time_units, step = field.split('/')

    if time_units == '*'
      step_values(step)
    else
      min, max = time_units.split('-').map(&:to_i)
      step_values(step).select { |unit| unit > min && unit <= max }
    end
  end

  def every_unit_field
    lapse.to_a
  end

  def range_field
    min, max = field.split('-').map(&:to_i)
    every_unit_field[min, max]
  end

  def step_values(step)
    lapse.step(step.to_i).to_a
  end
end
