class CreateCompanyAdmins < ActiveRecord::Migration
  def change
    create_table :company_admins do |t|
      t.string :first
      t.string :last
      t.string :title
      t.string :email
      t.text :password_digest
      t.belongs_to :company, index: true

      t.timestamps
    end
  end
end
