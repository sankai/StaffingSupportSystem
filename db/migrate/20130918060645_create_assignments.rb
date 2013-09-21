class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.date :from
      t.date :to
      t.string :roleComment
      t.string :status

      t.timestamps
    end
  end
end
