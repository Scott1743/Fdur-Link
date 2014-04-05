# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base
  belongs_to :user

  validates :state, presence: true,
                    in: ['private','public','closed','finished']

  validates :name, presence: true
end
