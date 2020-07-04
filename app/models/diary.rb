class Diary < ApplicationRecord
  belongs_to :user,optional: true
  # belongs_to :genre,optional: true
  has_many :comments
  has_many :genre_tags
  has_many :genres, through: :genre_tags
  
  
  # attr_accessor :genre_key
  
  def self.search(search)
    if search
      Diary.where(['text1 LIKE ?',"%#{search}%"])
    else
      Diary.all
    end
  end
  
  after_create do
    diary = Diary.find_by(id: id)
    genres = genre_name.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    genres.uniq.map do |genre|
      genre = Genre.find_or_create_by(genre_key: genre.downcase.delete("#"))
      diary.genres << genre
    end
  end
  
end
