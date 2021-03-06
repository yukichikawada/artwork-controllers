# == Schema Information
#
# Table name: artworks
#
#  id        :integer          not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#

class Artwork < ApplicationRecord
  validates :title, uniqueness: { scope: :artist_id }, presence: true
  validates :image_url, presence: true
  validates :artist_id, presence: true

  belongs_to :artist,
  foreign_key: :artist_id,
  class_name: :User

  has_many :artwork_views,
  foreign_key: :artwork_id,
  class_name: :ArtworkShare,
  dependent: :destroy

  has_many :comments,
  foreign_key: :artwork_id,
  class_name: :Comment,
  dependent: :destroy

  has_many :shared_viewers,
  through: :artwork_views,
  source: :viewer


end
