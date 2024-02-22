class Movie < ApplicationRecord
  # Relationship with bookmarks
  has_many :bookmarks
  # Through relationship to access all the lists a movie is associated with
  has_many :lists, through: :bookmarks

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
