class CreateFollowedJobs < ActiveRecord::Migration
  def change
    create_table :followed_jobs do |t|
      t.integer :job_id
      t.integer :user_id

      t.timestamps
    end
  end
end
