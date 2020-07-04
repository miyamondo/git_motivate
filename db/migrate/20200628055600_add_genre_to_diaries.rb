class AddGenreToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :genre, :string
  end
end
