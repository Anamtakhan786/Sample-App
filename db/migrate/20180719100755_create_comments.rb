class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :comment
      t.string :commenter_id
      t.references :micropost, foreign_key: true

      t.timestamps
    end
    add_index :comments, :comment
  end
end
