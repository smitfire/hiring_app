class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :admin_id

      t.timestamps
    end
    add_index :jobs, :admin_id
  end
end
