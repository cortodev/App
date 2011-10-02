class AddPolesMaskToUsers < ActiveRecord::Migration
  def change
    add_column :users, :poles_mask, :integer
  end
end
