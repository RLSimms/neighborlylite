class SharedItem < ActiveRecord::Base
  attr_accessible :available, :borrower_user_id, :description, :name, :owner_user_id, :price, :photo
  belongs_to :borrower_user, class_name: 'User'
  belongs_to :owner_user, class_name: 'User'

end
