class User < ActiveRecord::Base
  has_secure_password

  has_many :skills, as: :skillable, dependent: :destroy
  has_many :followed_jobs, dependent: :destroy
  has_many :job_interests, through: :followed_jobs, source: :job
  has_many :applied_jobs, -> { where(applied: true) }, through: :followed_jobs, source: :job

end
