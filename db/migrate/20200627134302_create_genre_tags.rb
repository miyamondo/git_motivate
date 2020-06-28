class CreateGenreTags < ActiveRecord::Migration[5.2]
  def change
    create_table :genre_tags do |t|
      t.references :diaries, foreign_key: true
      t.references :genres, foreign_key: true

      t.timestamps
    end
  end
end
