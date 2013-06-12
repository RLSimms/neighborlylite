class AddPaidToItemTransaction < ActiveRecord::Migration
  def change
    add_column :item_transactions, :paid, :boolean
  end
end
