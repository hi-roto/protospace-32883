class Prototype < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy 
  has_one_attached :image

  validates :image, :catch_copy, :concept, :title, presence: true
end
