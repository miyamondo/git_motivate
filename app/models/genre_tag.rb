class GenreTag < ApplicationRecord
  belongs_to :diary
  belongs_to :genre
  validates :diary_id, presence: true
  validates :genre_id, presence: true
end
