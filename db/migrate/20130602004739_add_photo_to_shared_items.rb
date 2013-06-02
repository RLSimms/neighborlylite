class AddPhotoToSharedItems < ActiveRecord::Migration
  def change
    add_column :shared_items, :photo, :string
  end
end
