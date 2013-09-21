class AddNumEngineerToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :num_engineer, :integer
  end
end
