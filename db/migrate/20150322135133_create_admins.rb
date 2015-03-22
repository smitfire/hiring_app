class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :first, limit: 30
      t.string :last, limit: 30
      t.string :password_digest
      t.string :email, null: false
      t.string :title
      t.integer :company_id

      t.timestamps
    end
    add_index :admins, :company_id, unique: true
  end
end
