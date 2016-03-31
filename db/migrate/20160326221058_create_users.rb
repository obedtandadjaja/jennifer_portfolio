class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :occupation
      t.string :slug, :unique => true
      t.integer :age
      t.string :bio
      t.timestamps null: false
    end
  end
end
