class CreateSharedItems < ActiveRecord::Migration
  def change
    create_table :shared_items do |t|
      t.string :name
      t.string :description
      t.boolean :available
      t.integer :owner_user_id
      t.integer :borrower_user_id

      t.timestamps
    end
  end
end
