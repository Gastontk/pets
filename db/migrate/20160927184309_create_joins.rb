class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.integer :user_id
      t.integer :pet_id

      t.timestamps null: false
    end
  end
end
