class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.string :name
      t.string :proficiency
      t.references :skillable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
