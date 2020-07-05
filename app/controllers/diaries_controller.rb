class DiariesController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show, :new_guest]
  # after_action :after_action, only: [:create]
  
  
  def new_guest
    user = User.find_or_create_by!(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to root_path, notice: "ゲストユーザーとしてログインしました"
  end
  
  def index
    @diaries = Diary.includes(:user).order("created_at DESC").page(params[:page]).per(5)
    @users = User.all
  end
  
  
  def new
    @diary = Diary.new
  end
  
  def create
    Diary.create(diary_params)
    redirect_to root_path
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
  
  def genre
    @user = current
    if paramas[:name].nil?
      @genres = Genre.all.to_a.group_by{ |genre| genre.diaries.count}
    else
      @genre = Genre.find_by(genre_key: params[:name])
      @diary = @genre.diary.page(params[:page]).per(20).reverse_order
      @genres = Genre.all.to_a.group_by{ |genre| genre.diaries.count}
    end
  end
  
  private
  
  def diary_params
    params.require(:diary).permit(:philosophy, :KPI, :text1, :text2, :genre_name, genre_ids: []).merge(user_id: current_user.id)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  

 
end
