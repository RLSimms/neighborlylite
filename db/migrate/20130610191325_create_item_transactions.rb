class CreateItemTransactions < ActiveRecord::Migration
  def change
    create_table :item_transactions do |t|
      t.integer :owner_user_id
      t.integer :borrower_user_id
      t.decimal :rate
      t.integer :days
      t.datetime :borrow_date
      t.datetime :return_date

      t.timestamps
    end
  end
end
