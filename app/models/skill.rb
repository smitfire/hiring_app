class Skill < ActiveRecord::Base
  belongs_to :skillable, polymorphic: true

  # Validations
  validates :skillable_type, :name, :proficiency, presence: true
  validates :proficiency, inclusion: { in: %w(expert intermediate basic),
      message: "%{value} is not a valid proficiency" }
end
