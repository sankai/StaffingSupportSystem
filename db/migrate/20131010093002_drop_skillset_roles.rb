class DropSkillsetRoles < ActiveRecord::Migration
  def up
    drop_table :skillset_roles
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
