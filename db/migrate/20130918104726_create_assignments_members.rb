class CreateAssignmentsMembers < ActiveRecord::Migration

  def change
    create_table :assignments_members, :id => false do |t|
      t.references :assignment, index: true
      t.integer :assignment_id
      t.references :member, index: true
      t.integer :member_id
    end
  end

end