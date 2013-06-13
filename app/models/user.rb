class User < ActiveRecord::Base
  attr_accessible :address, :email, :name, :password, :password_confirmation, :photo, :avatar
  has_secure_password

  has_many :given_errands, class_name: 'Errand', foreign_key: 'giving_user_id'
  has_many :received_messages, class_name: 'Errand', foreign_key: 'receiving_user_id'

  has_many :loaned_items, class_name: 'Shared Item', foreign_key: 'owner_user_id'
  has_many :borrowed_items, class_name: 'Shared Item', foreign_key: 'borrower_user_id'

  has_many :received_messages, class_name: 'Message', foreign_key: 'receiver_id'
  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  has_many :chats

end
