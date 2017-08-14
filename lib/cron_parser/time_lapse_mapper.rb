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
      every_unit
    elsif field.include?('/')
      a, b = field.split('/')
      if a == '*'
        lapse.step(b.to_i).to_a
      else
        c,d = a.split('-').map(&:to_i)
        lapse.step(b.to_i).to_a.select { |x| x > c && x <= d }
      end
    elsif field.include?('-')
      a, b = field.split('-').map(&:to_i)
      every_unit[a,b]
    else
      field.split(',')
    end
  end

  def every_unit
    lapse.to_a
  end

end
