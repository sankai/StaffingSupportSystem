class CreateSkillsetLangs < ActiveRecord::Migration
  def change
    create_table :skillset_langs do |t|
      t.string :name
      t.string :memo

      t.timestamps
    end
  end
end
