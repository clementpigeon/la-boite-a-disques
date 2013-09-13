class Track < ActiveRecord::Base

  attr_accessible :title,:bonus, :lyrics, :album_id, :track_number, :length
  validates :album_id, :title, presence: true

  before_validation :not_bonus_by_default

  belongs_to :album

  def not_bonus_by_default
    if self.bonus.nil?
      self.bonus = 0
    end
  end

  def band
    self.album.band
  end

end
