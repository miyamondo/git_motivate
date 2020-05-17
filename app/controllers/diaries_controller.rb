class DiariesController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @diaries = Diary.all.order("created_at DESC").page(params[:page]).per(5)
  end
  
  def new
  end
  
  def create
    Diary.create(philosophy: diary_params[:philosophy], KPI: diary_params[:KPI], text1: diary_params[:text1], text2: diary_params[:text2], user_id: current_user.id)
  end
  
  def destroy
    diary = Diary.find(params[:id])
    if diary.user_id == current_user.id
      diary.destroy
    end
  end
  
  def edit
    @diary = Diary.find(params[:id])
  end
  
  def update
    diary = Diary.find(params[:id])
    if diary.user_id == current_user.id
      diary.update(diary_params)
    end
  end
  
  def show
    @diary = Diary.find(params[:id])
    @comments = @diary.comments.includes(:user)
  end
  
  private
  def diary_params
    params.permit(:philosophy, :KPI, :text1, :text2)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
 
end
