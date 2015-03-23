class Company < ActiveRecord::Base

  has_many :admins, dependent: :destroy
  has_many :job_openings, through: :admins, source: :posted_jobs
  has_many :candidates, through: :job_openings, source: :candidates
  has_attached_file :logo, :styles => { :large  => "500x500>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  # Validations
  validates :name, :description, :website, :moto, presence: true
  validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
  validates :name, length: { minimum: 2 }
end
