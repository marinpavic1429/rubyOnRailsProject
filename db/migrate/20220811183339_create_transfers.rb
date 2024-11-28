class CreateTransfers < ActiveRecord::Migration[7.0]
  def change
    create_table :transfers do |t|
      t.string :first_name
      t.string :last_name
      t.string :club_from
      t.string :club_to
      t.string :transfer_fee

      t.timestamps
    end
  end
end
