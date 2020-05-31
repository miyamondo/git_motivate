class Diaries::SearchesController < ApplicationController
  def index
    @search_diaries = Diary.search(params[:search])
  end
end
