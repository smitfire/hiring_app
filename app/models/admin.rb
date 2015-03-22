class Admin < ActiveRecord::Base
  has_secure_password

  belongs_to :company
  has_many :posted_jobs, class_name: 'Job', foreign_key: 'admin_id', dependent: :destroy
  has_many :interested_users, through: :posted_jobs, source: :interested_users
  has_many :candidates, -> { where(applied: true) }, through: :posted_jobs, source: :followed_jobs

  # Validations
  validates :first, :title, :last, :email, :password, presence: true
  validates :first, :last, length: { in: 2..30 }
  validates :password, confirmation: true, length: { in: 6..20 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
end
