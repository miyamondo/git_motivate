class RenameGenreColumnToGenres < ActiveRecord::Migration[5.2]
  def change
    rename_column :genres, :genre, :genre_key
  end
end
