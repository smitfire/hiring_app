class FollowedJob < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  # Validations
  validates :job_id, :user_id, presence: true
  validates :applied, inclusion: { in: [true, false] }
  validates :job_id, :uniqueness => {:scope=>:user_id}

end
