class User < ActiveRecord::Base
  has_secure_password

  has_many :followed_jobs
  has_many :jobs, through: :followed_jobs
end
