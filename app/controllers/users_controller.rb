class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    # @diaries = Diary.where(user_id: current_user.id) アソシエを行う前
    @diaries = current_user.diaries.order("created_at DESC").page(params[:page]).per(5)
  end
end
