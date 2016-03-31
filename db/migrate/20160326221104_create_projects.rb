class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :subtitle
      t.string :description_brief
      t.string :description_long
      t.string :slug, :unique => true
      t.references :user
      t.timestamps null: false
    end
  end
end
