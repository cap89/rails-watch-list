class Bookmark < ApplicationRecord
  # Belongs to a movie
  belongs_to :movie
  # Belongs to a list
  belongs_to :list
end
