class Post < ApplicationRecord
  attr_accessor :town_name
  belongs_to :user,optional: true
  belongs_to :town,optional: true
  belongs_to :category,optional: true    

  has_one_attached :image

  validates :image,presence: true
  validates :town,presence: true
  validates :category,presence: true
  validates :title,presence: true
end
