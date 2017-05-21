#
# ShelterDate enables us to associate an overnight stay in a shelter by a client
# with a single unambiguous date, rather than a pair of dates crossing midnight.
# The date chosen is always the start date -- that is, the date prior to
# midnight. This is especially important because some clients may not
# actually arrive at a shelter until after midnight.  ShelterDate takes a real
# datetime, and a cutoff hour (integer representing hours past midnight) and
# returns a "shelter date".
# @see schema.rb
#
class ShelterDate
  include Comparable
  attr_reader :date, :cutoff_hour

  def initialize(datetime, cutoff_hour)
    @cutoff_time = cutoff_hour
    datetime = DateTime.parse(datetime) if datetime.is_a? String
    @date = if datetime.hour < cutoff_hour
              datetime.to_date - 1.day
            else
              datetime.to_date
            end
  end

  def to_s
    date.to_s
  end

  def <=>(other)
    return nil unless other
    date <=> other.date
  end
end
