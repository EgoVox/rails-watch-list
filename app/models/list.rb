class List < ApplicationRecord
  # validates :name, allow_blank: false
  validates :name, presence: true, uniqueness: true;
  has_many :bookmarks
  has_many :movies, through: :bookmarks,  dependent: :destroy
  has_many :reviews, dependent: :destroy
end
