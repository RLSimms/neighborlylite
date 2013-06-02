class CreateErrands < ActiveRecord::Migration
  def change
    create_table :errands do |t|
      t.string :name
      t.text :description
      t.string :location
      t.integer :giving_user_id
      t.integer :receiving_user_id
      t.boolean :completed

      t.timestamps
    end
  end
end
