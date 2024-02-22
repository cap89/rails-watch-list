class List < ApplicationRecord
  # Relationship with bookmarks
  has_many :bookmarks
  # Through relationship to access all the movies in a list
  has_many :movies, through: :bookmarks
end
