#
# ShelterDate enables us to associate an overnight stay in a shelter by a client
# with a single unambiguous date, rather than a pair of dates crossing midnight.
# The date chosen is always the start date -- that is, the date prior to
# midnight. This is especially important because some clients may not
# actually arrive at a shelter until after midnight.  ShelterDate takes a real
# datetime, and a cutoff hour (integer representing hours past midnight) and
# returns a "shelter date". If not provided, the cutoff hour defaults to 3am.
# Will provide the current shelterdate if datetime argument is nil.
#
class ShelterDate
  include Comparable
  attr_reader :date, :cutoff_hour

  # @param datetime in string or object form
  # @param cutoff_hour [Integer] integer representing cutoff hour
  def initialize(datetime, cutoff_hour = 3)
    @cutoff_time = cutoff_hour
    datetime ||= DateTime.now
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
