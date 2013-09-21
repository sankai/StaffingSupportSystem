class AddDeptIdToAnken < ActiveRecord::Migration
  def change
    add_column :ankens, :dept_id, :integer
  end
end
