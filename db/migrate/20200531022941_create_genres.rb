class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :genre, unique: true
      t.text :detail
      t.timestamps
    end
  end
end
