class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string :philosophy
      t.text :KPI
      t.text :text
      t.text :text2
      t.timestamps
    end
  end
end
