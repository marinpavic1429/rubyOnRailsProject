class AddUserIdToTransfers < ActiveRecord::Migration[7.0]
  def change
    add_column :transfers, :user_id, :integer
    add_index :transfers, :user_id
  end
end
