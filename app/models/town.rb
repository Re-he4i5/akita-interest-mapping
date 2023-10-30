class Town < ApplicationRecord
  has_many :posts,dependent: :destroy
  geocoded_by :name
  after_validation :geocode

end
