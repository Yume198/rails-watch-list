class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  has_one_attached :photo

  has_many :reviews, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
