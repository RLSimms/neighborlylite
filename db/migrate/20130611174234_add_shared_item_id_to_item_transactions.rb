class AddSharedItemIdToItemTransactions < ActiveRecord::Migration
  def change
    add_column :item_transactions, :shared_item_id, :integer
  end
end
