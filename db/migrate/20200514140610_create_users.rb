class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :genre_id
      t.string :nickname
      t.text :philosophy

      t.timestamps
    end
  end
end
