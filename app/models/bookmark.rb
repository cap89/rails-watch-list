class Bookmark < ApplicationRecord
  # Belongs to a movie
  belongs_to :movie
  # Belongs to a list
  belongs_to :list

  validates :movie_id, presence: true
  validates :list_id, presence: true
  # Validates the uniqueness of the movie_id scoped to the list_id, ensuring unique [movie, list] pairings
  validates :movie_id, uniqueness: { scope: :list_id, message: "should be unique per list" }
  validates :comment, presence: true, length: { minimum: 6 }
end
