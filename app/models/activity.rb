# == Schema Information
#
# Table name: activities
#
#  id                 :integer          not null, primary key
#  project_id         :integer          not null
#  project_state_flag :integer
#  commits_count      :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Activity < ActiveRecord::Base

  belongs_to :project, :foreign_key => :project_id

end
