class AddDobToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :DOB, :date
  end
end
