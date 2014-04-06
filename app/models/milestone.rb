# == Schema Information
#
# Table name: milestones
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text
#  reflections :text
#  image       :string(255)
#  num         :integer
#  state       :string(255)      not null
#  project_id  :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Milestone < ActiveRecord::Base
  belongs_to :project

  validates :state, presence: true,
            inclusion: ['undo','doing','finished']
end
