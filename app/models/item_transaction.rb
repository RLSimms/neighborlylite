class ItemTransaction < ActiveRecord::Base
  attr_accessible :borrow_date, :borrower_user_id, :days, :owner_user_id, :rate, :return_date
end
