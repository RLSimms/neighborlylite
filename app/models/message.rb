class Message < ActiveRecord::Base
  attr_accessible :conversation_id, :receiver_id, :sender_id, :whats_written
end
