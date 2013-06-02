class Errand < ActiveRecord::Base
  attr_accessible :completed, :description, :giving_user_id, :location, :name, :receiving_user_id
  belongs_to :giving_user, class_name: 'User'
  belongs_to :receiving_user, class_name: 'User'

end
