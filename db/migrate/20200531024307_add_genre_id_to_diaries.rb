class AddGenreIdToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :genre_id, :integer
  end
end
