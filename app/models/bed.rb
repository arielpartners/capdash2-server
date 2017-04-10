class Bed < Place
  after_initialize :ensure_bed_count
  validate :only_one_bed

  private

  def ensure_bed_count
    self.bed_count = 1
  end

  def only_one_bed
    errors.add(:bed_count, 'must equal 1') unless bed_count == 1
  end
end
