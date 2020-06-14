class Genre < ApplicationRecord
  has_many :diaries
  accepts_nested_attributes_for :diaries
  belongs_to :user,optional: true
  
  attr_accessor :diary
  
end
