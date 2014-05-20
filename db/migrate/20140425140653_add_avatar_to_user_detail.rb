class AddAvatarToUserDetail < ActiveRecord::Migration
  def up
    remove_column :user_details, :avatar
    add_attachment :user_details, :avatar
  end

  def down
    remove_attachment :user_details, :avatar
    add_column :user_details, :avatar, :string
  end
end
