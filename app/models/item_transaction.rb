class ItemTransaction < ActiveRecord::Base
  attr_accessible :borrow_date, :borrower_user_id, :days, :owner_user_id, :rate, :return_date, :paid, :shared_item_id
  belongs_to :shared_item
  belongs_to :borrower_user, class_name: 'User'
  belongs_to :owner_user, class_name: 'User'
end
