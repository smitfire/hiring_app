class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :description
      t.string :website
      t.string :moto
      t.attachment :logo

      t.timestamps
    end
  end
end
