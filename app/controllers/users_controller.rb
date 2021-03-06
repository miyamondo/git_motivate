class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    # @diaries = Diary.where(user_id: current_user.id) アソシエを行う前
    @diaries = @user.diaries.order("created_at DESC").page(params[:page]).per(5)
    @task = Task.all.order("created_at DESC").page(params[:page]).per(5)
    
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(update_params)
  end
  
  def following
    @user =User.find(params[:id])
    @users =@user.followings.page(params[:page]).per(5)
    render 'show_following'
  end

  def followers
    @user =User.find(params[:id])
    @users =@user.followers.page(params[:page]).per(5)
    render 'show_followers'
  end
  
  
  private
  def diary_params
    params.permit(:philosophy, :KPI, :text1, :text2, :genre_name, :user_id)
  end
  
  
  def update_params
    params.require(:user).permit(:nickname, :image, :introduction)
  end
  
end
