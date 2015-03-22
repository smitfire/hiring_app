class CreateFollowedJobs < ActiveRecord::Migration
  def change
    create_table :followed_jobs do |t|
      t.integer :job_id
      t.integer :user_id
      t.boolean :applied, default: false, null: false

      t.timestamps
    end
    add_index :followed_jobs, [:user_id, :job_id], unique: true
  end
end
