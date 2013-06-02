class Conversation < ActiveRecord::Base
  attr_accessible :user_1_id, :user_2_id
  belongs_to :sender, class_name: 'User', foreign_key: 'user_1_id'
  belongs_to :receiver, class_name: 'User', foreign_key: 'user_2_id'
  has_many :messages
end
