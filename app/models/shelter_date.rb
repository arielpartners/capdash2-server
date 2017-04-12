class ShelterDate
  include Comparable
  attr_reader :date, :cutoff

  def initialize(datetime, cutoff)
    @cutoff = cutoff
    datetime = DateTime.parse(datetime) if datetime.is_a? String
    @date = datetime.hour < cutoff ? datetime.to_date - 1.day : datetime.to_date
  end

  def to_s
    date.to_s
  end

  def <=>(other)
    return nil unless other
    date <=> other.date
  end
end
