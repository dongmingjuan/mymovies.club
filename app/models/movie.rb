class Movie < ApplicationRecord
                  belongs_to :user
                  validates :title, presence: true
                  has_many :comments
                  mount_uploader :image, ImageUploader
end
