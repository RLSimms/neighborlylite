class Errand < ActiveRecord::Base
  attr_accessible :completed, :description, :giving_user_id, :location, :name, :receiving_user_id, :price
  belongs_to :giving_user, class_name: 'User'
  belongs_to :receiving_user, class_name: 'User'

  scope :unique_errand_names, lambda { select(:name).uniq}

end
