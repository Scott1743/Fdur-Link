#encoding: utf-8
#formation
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
  has_many :milestones, dependent: :destroy

  before_validation :add_default_information

  after_save :create_default_milestone

  validates :state, presence: true,
                    inclusion: ['open','finished']
  #VALID_IMAGE_REGEX = /(http:\/\/[\s\S]*.(jpg|png|gif))|(default)/
  #validates :image, format: {with: VALID_IMAGE_REGEX}

  validates :is_public, inclusion: [true, false]
  validates :name, presence: true

  private

  def add_default_information
    self.state = 'open' if self.state.blank?

    self.name = '未命名' if self.name.blank?

    unless self.image.match /http:\/\/[\s\S]*.(jpg|png|gif)/
      self.image = '' if self.image.blank?
    end
  end

  def create_default_milestone
    if self.milestones.blank?
      self.milestones.create name: "开启了新计划——#{self.name}", state: 'finished'
    end
  end
end
