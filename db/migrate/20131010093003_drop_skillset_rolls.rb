class DropSkillsetRolls < ActiveRecord::Migration
  def up
    drop_table :skillset_rolls
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
