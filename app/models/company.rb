class Company < ActiveRecord::Base
  has_one :company_admin
  has_many :jobs
end
