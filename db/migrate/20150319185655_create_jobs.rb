class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :admin_id
      t.boolean :applied, default: false

      t.timestamps
    end
  end
end
