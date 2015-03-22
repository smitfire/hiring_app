class Job < ActiveRecord::Base
  belongs_to :admin

  has_many :requirements, class_name: 'Skill', as: :skillable, dependent: :destroy
  has_many :followed_jobs, dependent: :destroy
  has_many :interested_users, through: :followed_jobs, source: :user
  has_many :candidates, -> { where(applied: true) }, class_name: 'FollowedJob'

  # Validations
  validates :title, :description,  presence: true
  validates :description, length: { in: 10..1000 }

end
