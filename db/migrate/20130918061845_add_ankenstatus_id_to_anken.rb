class AddAnkenstatusIdToAnken < ActiveRecord::Migration
  def change
    add_column :ankens, :ankenstatus_id, :integer
  end
end
