class Album < ActiveRecord::Base
  attr_accessible :album_type, :title, :year,:band_id
  validates :band_id, :title, presence: true
  validates :album_type, inclusion: { in: ['LP', 'live', 'compilation'] }
  validates :band_id, :title, presence: true

  before_validation :default_album_type

  belongs_to :band
  has_many :tracks

  def default_album_type
    puts 'default type'
    if self.album_type.nil?
      self.album_type = 'LP'
    end
  end


end
