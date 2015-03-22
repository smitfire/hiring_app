class Company < ActiveRecord::Base

  has_many :admins, dependent: :destroy
  has_many :job_openings, through: :admins, source: :posted_jobs
  has_many :candidates, through: :job_openings, source: :candidates

  # Validations
  validates :name, presence: true
  validates :name, length: { minimum: 2 }
end
