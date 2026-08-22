class Movie < ApplicationRecord
  belongs_to :list
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true, uniqueness: true
  validates :poster_url, presence: true
  validates :rating, presence: true
end
