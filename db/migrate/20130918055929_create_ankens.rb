class CreateAnkens < ActiveRecord::Migration
  def change
    create_table :ankens do |t|
      t.string :name
      t.string :customer
      t.integer :estimatePrice
      t.string :memo

      t.timestamps
    end
  end
end
