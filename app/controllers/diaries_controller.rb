class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
  end
  
  def new
  end
  
  def create
    Diary.create(diary_params)
  end
  
  private
  def diary_params
    params.permit(:philosophy, :KPI, :text1, :text2)
  end
 
end
