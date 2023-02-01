class CreateDos < ActiveRecord::Migration[6.1]
  def change
    create_table :dos do |t|
      t.string :content
      t.references :goal, null: false, foreign_key: true
      t.integer :position
      t.boolean :done, null: false, default: 

      t.timestamps
    end
  end
end
