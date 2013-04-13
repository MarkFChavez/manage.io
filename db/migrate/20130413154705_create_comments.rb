class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.references :project
      t.integer :lock_version, default: 0

      t.timestamps
    end
    add_index :comments, :project_id
  end
end
