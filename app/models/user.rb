# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#  password_digest :string(255)
#  remember_token  :string(255)
#  permission_id   :integer          default(1), not null
#

class User < ActiveRecord::Base
  has_many :projects, dependent: :destroy
  belongs_to :permission, dependent: :destroy
  has_one :user_detail, dependent: :destroy
  has_many :follows
  
  before_save { self.email.downcase! }
  before_save :create_remember_token
  after_save :create_detail

  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
  validates :password,length:{minimum: 6}
  validates :password_confirmation, presence: true
  
  def name
    self.user_detail.nil? ? nil : self.user_detail.name
  end

  def followed? project
    !Follow.ransack({user_id_eq: self.id, project_id_eq: project.id}).result.blank?
  end

  def followed_projects
    Project.ransack({follows_user_id_eq: self.id}).result
  end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end

    def create_detail
      if self.name.blank?
        default_name = self.email.match(/(\A[\w+\-.]+)@[a-z\d\-.]+\.[a-z]+\z/)[1]
        self.create_user_detail name: default_name
      end
    end

end
