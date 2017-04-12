class ShelterDate
  include Comparable
  attr_reader :time

  def initialize(time)
    @time = time
  end

  def to_s
    date.to_s
  end

  def date_cutoff(hour)
    time.hour < hour ? time.to_date - 1.day : time.to_date
  end

  def <=>(other)
    time <=> other.time
  end

  def self.parse(timestr)
    time = DateTime.parse(timestr)
    new(time)
  end
end
