class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :first
      t.string :last
      t.text :password_digest
      t.string :email
      t.string :title
      t.integer :company_id

      t.timestamps
    end
  end
end
