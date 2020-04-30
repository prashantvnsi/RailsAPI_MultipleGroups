class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :fname
      t.string :lname
      t.string :address
      t.string :division
      t.string :gender
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
