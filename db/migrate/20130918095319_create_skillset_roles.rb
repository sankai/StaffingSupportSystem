class CreateSkillsetRoles < ActiveRecord::Migration
  def change
    create_table :skillset_roles do |t|
      t.string :name
      t.string :memo

      t.timestamps
    end
  end
end
