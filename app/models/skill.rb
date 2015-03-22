class Skill < ActiveRecord::Base
  # belongs_to :user
  # belongs_to :job
  belongs_to :skillable, polymorphic: true
end
