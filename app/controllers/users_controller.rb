class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @nickname = current_user.nickname
    # @diaries = Diary.where(user_id: current_user.id) アソシエを行う前
    @diaries = current_user.diaries.order("created_at DESC").page(params[:page]).per(5)
  end
  
  def edit
  end
  
  def update
    current_user.update(update_params)
  end
  
  private
  def update_params
    paramas.require(:user).permit(:nickname,:image)
  end
  
end
