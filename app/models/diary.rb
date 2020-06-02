class Diary < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :comments
  
  attr_accessor :genre_key
  
  def self.search(search)
    if search
      Diary.where(['text1 LIKE ?',"%#{search}%"])
    else
      Diary.all
    end
  end
end
