class ShelterDate
  attr_reader :date

  def initialize(time)
    @actual_time = time
    @date = time.hour < 3 ? time.to_date - 1.day : time.to_date
  end

  def to_s
    date.to_s
  end
end
