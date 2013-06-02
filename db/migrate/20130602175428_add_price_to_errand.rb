class AddPriceToErrand < ActiveRecord::Migration
  def change
    add_column :errands, :price, :string
  end
end
