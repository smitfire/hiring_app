class Admin < ActiveRecord::Base
  has_secure_password

  belongs_to :company
  has_many :posted_jobs, class_name: 'Job', foreign_key: 'admin_id', dependent: :destroy
  has_many :interested_users, through: :posted_jobs, source: :interested_users
  has_many :candidates, -> { where(applied: true) }, through: :posted_jobs, source: :candidates

end
