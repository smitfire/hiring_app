class User < ActiveRecord::Base
  has_secure_password

  has_many :skills, as: :skillable, dependent: :destroy
  has_many :followed_jobs, dependent: :destroy
  has_many :job_interests, through: :followed_jobs, source: :job
  has_many :applied_jobs, -> { where(applied: true) }, class_name: 'FollowedJob'

  # Validations
  validates :first, :last, :email, :password, presence: true
  validates :first, :last, length: { in: 2..30 }
  validates :password, confirmation: true, length: { in: 6..20 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true

end
