class Album < ActiveRecord::Base
  ALBUM_TYPES = ['LP', 'live album', 'compilation']

  attr_accessible :album_type, :title, :year,:band_id
  validates :band_id, :title, presence: true
  validates :title, uniqueness: true
  validates :album_type, inclusion: { in: ALBUM_TYPES }


  before_validation :default_album_type

  belongs_to(
  :band,
  class_name: 'Band',
  primary_key: :id,
  foreign_key: :band_id
  )

  has_many(
  :tracks,
  class_name: 'Track',
  primary_key: :id,
  foreign_key: :album_id
  )

  def default_album_type
    if self.album_type.nil?
      self.album_type = 'LP'
    end
  end

  def self.album_types
    ALBUM_TYPES
  end


end
