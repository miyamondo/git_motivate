class GenreTag < ApplicationRecord
  belongs_to :diaries
  belongs_to :genres
end
