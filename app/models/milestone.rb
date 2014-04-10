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
  belongs_to :project, :foreign_key => :project_id

  before_validation :set_default_information

  validates :state, presence: true,
            inclusion: ['undo','doing','finished']

  private

  def set_default_information
    self.state = 'undo'
  end

end
