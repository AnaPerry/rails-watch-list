class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie
  validates :comment, presence: true, length: { minimum: 6, message: "it must have at least 6 char" }
  validates :movie_id, presence: true, uniqueness: { scope: :list_id }
  validates :list_id, presence: true
end
