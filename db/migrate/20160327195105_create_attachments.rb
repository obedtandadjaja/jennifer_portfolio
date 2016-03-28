class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :title
   	  t.string :description
      t.boolean :is_primary, default: false
      t.string :url
      t.references :project, :null => true
      t.timestamps null: false
    end
  end
end
