class DropSkillsetLangs < ActiveRecord::Migration
  def up
    drop_table :skillset_langs
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
