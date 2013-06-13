class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.string :content

      t.timestamps
    end
  end
end
