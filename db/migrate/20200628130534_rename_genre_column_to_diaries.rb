class RenameGenreColumnToDiaries < ActiveRecord::Migration[5.2]
  def change
    rename_column :diaries, :genre, :genre_name
  end
end
