class CreateSkillsets < ActiveRecord::Migration
  def change
    create_table :skillsets do |t|
      t.string :name
      t.string :memo
      t.string :field

      t.timestamps
    end
  end
end
