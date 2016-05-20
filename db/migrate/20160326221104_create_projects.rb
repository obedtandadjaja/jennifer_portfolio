class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :subtitle
      t.string :description
      t.string :slug, :unique => true
      t.references :user
      t.timestamps null: false
    end
  end
end
