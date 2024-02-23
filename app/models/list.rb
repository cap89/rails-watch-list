class List < ApplicationRecord
  # Relationship with bookmarks
  has_many :bookmarks, dependent: :destroy
  # Through relationship to access all the movies in a list
  has_many :movies, through: :bookmarks
  has_one_attached :photo

  validates :name, presence: true, uniqueness: true
end
