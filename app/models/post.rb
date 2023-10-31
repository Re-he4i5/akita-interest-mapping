class Post < ApplicationRecord
  attr_accessor :town_name
  belongs_to :user,optional: true
  belongs_to :town,optional: true
  belongs_to :category,optional: true    
  has_many :favorites,dependent: :destroy
  has_many :comments,dependent: :destroy

  has_one_attached :image

  validates :image,presence: true
  validates :town,presence: true
  validates :category,presence: true
  validates :title,presence: true
  validates :star,presence: true

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
