class RemoveCommenterIdComment < ActiveRecord::Migration[5.2]
  def change
  	remove_column :comments, :commenter_id
  end
end
