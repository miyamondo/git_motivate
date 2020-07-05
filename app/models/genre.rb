class Genre < ApplicationRecord
  # has_many :diaries
  # accepts_nested_attributes_for :diaries
  # belongs_to :user,optional: true
  # attr_accessor :diary
  validates :genre_key, presence: true, length: { maximum: 50 }
  has_many :genre_tags, dependent: :destroy
  has_many :diaries, through: :genre_tags
  
end
