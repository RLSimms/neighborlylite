class Message < ActiveRecord::Base
  attr_accessible :conversation_id, :receiver_id, :sender_id, :whats_written
  belongs_to :receiver, class_name: 'User'
  belongs_to :sender, class_name: 'User'
  belongs_to :conversation

end
