#encoding: utf-8
# == Schema Information
#
# Table name: milestones
#
#  id          :integer          not null, primary key
#  name        :string(255)      not null
#  description :text
#  reflection  :text
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

  validates :name, presence: true
  validates :state, presence: true,
            inclusion: ['undo','doing','finished']

  private

  def set_default_information
    self.name = '未命名' if self.name.blank?

    self.state = 'undo' if self.state.blank?
  end

end
