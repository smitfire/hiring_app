class User < ActiveRecord::Base
  has_secure_password

  has_many :skills, as: :skillable, dependent: :destroy
  has_many :followed_jobs, dependent: :destroy
  has_many :job_interests, through: :followed_jobs, source: :job
  has_many :applied_jobs, -> { where(applied: true) }, class_name: 'FollowedJob'
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  # Validations
  validates :first, :last, :email, :password, presence: true
  validates :first, :last, length: { in: 2..30 }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates :password, confirmation: true, length: { in: 6..20 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true

end
