class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first, limit: 30
      t.string :last, limit: 30
      t.string :password_digest
      t.string :password_digest
      t.date :birthday
      t.attachment :avatar

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
