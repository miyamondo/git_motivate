class GenresController < ApplicationController
  
  def index
  end
  
  def show
    # @genres = Genre.find(params[:id]) 
    # @diaries = Diary.where(genre_id:)
    @diaries = Diary.find(params[:id])
    @genres = Diary.where(genre_id: @diaries.id)
  end
  
  def new
    @genre = Genre.new
    @genre.diaries.build
  end
  
  def create
    @genre = Genre.create(genre_params)
    # @genre = Genre.new(genre_params)
    # @genre.save!
    redirect_to root_path

  end
  
  private
  def genre_params
    params.require(:genre).permit(:id, :genre_key, diaries_attributes: [:philosophy, :KPI, :text1, :text2, :user_id])
  end
  

end
