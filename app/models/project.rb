# == Schema Information
#
# Table name: projects
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  image       :string(255)
#  description :text
#  user_id     :integer
#  is_public   :boolean          not null
#  state       :string(255)      not null
#  num         :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Project < ActiveRecord::Base
  belongs_to :user
  has_many :milestones

  validates :state, presence: true,
                    inclusion: ['open','closed','finished']
  VALID_IMAGE_REGEX = /http:\/\/[\s\S]+.(jpg|png|gif)/
  validates :image, format: {with: VALID_IMAGE_REGEX}

  validates :is_public, inclusion: [true, false]
  validates :name, presence: true
end
