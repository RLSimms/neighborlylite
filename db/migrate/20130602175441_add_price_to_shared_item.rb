class AddPriceToSharedItem < ActiveRecord::Migration
  def change
    add_column :shared_items, :price, :string
  end
end
