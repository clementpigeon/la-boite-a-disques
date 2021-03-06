class Track < ActiveRecord::Base
  include TracksHelper
  attr_accessible :title,:bonus, :lyrics, :album_id, :track_number, :length
  validates :album_id, :title, presence: true

  before_validation :not_bonus_by_default

  belongs_to(
  :album,
  class_name: 'Album',
  foreign_key: :album_id,
  primary_key: :id
  )

  has_one :band, through: :album, source: :band

  has_many(
    :notes,
    class_name: 'Note',
    foreign_key: :track_id,
    primary_key: :id
  )

  def not_bonus_by_default
    if self.bonus.nil?
      self.bonus = 0
    end
  end


end
