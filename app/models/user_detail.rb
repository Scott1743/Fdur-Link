# == Schema Information
#
# Table name: user_details
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  avatar      :string(255)
#  qqnumber    :string(255)
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class UserDetail < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, :styles => { :medium => "300*300>", :thumb => "50*50>" }, :default_url => "icon/default_avatar.png"
  validates_attachment :avatar,
                       content_type: { :content_type => /\Aimage/ },
                       file_name: { :matches => [/png\Z/, /jpe?g\Z/] },
                       size: { in: 0..2048.kilobytes }

  validates :name, presence: true, length: { maximum: 20 }
end
