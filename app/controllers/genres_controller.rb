class GenresController < ApplicationController
  
  def show
    # @genres = Genre.find(params[:id]) 
    # @diaries = Diary.where(genre_id: )
    
    @diaries = Diary.find(params[:id])
    @genres = Diary.where(genre_id: @diaries.id)
  end
  

end
