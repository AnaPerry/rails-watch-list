class List < ApplicationRecord
  has_many :movies, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  validates :name, presence: true
end
