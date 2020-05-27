class User < ApplicationRecord
  # encrypt password
  has_secure_password
  
  before_create :init
  after_create :prepare_creation

  belongs_to :client, optional: true

  has_many :user_login_historics, dependent: :destroy

  #validations
  validates_presence_of :name, :email, :password_digest
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 8 },
            if: -> { new_record? || !password.nil? }

  enum user_type: [
    :patient, 
    :master_user, 
    :doctor, 
    :admin
  ]

  private


  def init
    self.sign_in_count ||= 0
  end
  
  def prepare_creation
    #send a notification email
    UserMailer.send_welcome_email(self).deliver_now
  end
end
