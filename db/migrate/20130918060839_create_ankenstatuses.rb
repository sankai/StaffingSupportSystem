class CreateAnkenstatuses < ActiveRecord::Migration
  def change
    create_table :ankenstatuses do |t|
      t.string :name

      t.timestamps
    end
  end
end
