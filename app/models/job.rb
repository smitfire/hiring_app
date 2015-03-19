class Job < ActiveRecord::Base
  belongs_to :company
  has_many :followed_jobs
  has_many :users, through: :followed_jobs
end
