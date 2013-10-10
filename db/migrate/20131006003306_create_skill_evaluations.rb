class CreateSkillEvaluations < ActiveRecord::Migration
  def change
    create_table :skill_evaluations do |t|
      t.string :evaluation
      t.integer :member_id
      t.integer :skillset_id

      t.timestamps
    end
  end
end
