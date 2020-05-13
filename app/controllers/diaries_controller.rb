class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
  end
  
  def new
  end
  
  def create
  end
  
  private
 
end
