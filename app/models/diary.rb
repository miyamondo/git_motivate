class Diary < ApplicationRecord
  belongs_to :user
  has_many :comments
  
  def self.search(search)
    if search
      Diary.where(['text1 LIKE ?',"%#{search}%"])
    else
      Diary.all
    end
  end
end
