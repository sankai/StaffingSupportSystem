class AddDeptIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :dept_id, :string
  end
end
