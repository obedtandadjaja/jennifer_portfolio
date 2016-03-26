class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
   	  t.string :title
   	  t.string :description
      t.boolean :is_primary, default: false
      t.string :url
      t.references :project, :null => true
      t.references :user, :null => true
      t.timestamps null: false
    end
  end
end
