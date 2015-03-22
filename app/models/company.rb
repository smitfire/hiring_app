class Company < ActiveRecord::Base

  has_many :admins, dependent: :destroy
  has_many :job_openings, through: :admins, source: :posted_jobs, dependent: :destroy
  has_many :candidates, through: :job_openings, source: :candidates

end
