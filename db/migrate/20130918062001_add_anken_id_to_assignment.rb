class AddAnkenIdToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :anken_id, :integer
  end
end
