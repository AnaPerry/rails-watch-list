class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates :comment, presence: true
  validates :movie_id, presence: true
  validates :list_id, presence: true
end
