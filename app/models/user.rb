class User < ApplicationRecord
  belongs_to :campus
  belongs_to :department, optional: true 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum account_status: [:activated, :deactivated]
  enum account_type: [:staff_member, :student, :staff_admin]
  
  DEFAULT_PASSWORD = 'password1'

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates_presence_of :title, :first_name, :last_name, :gender, :account_type

  def activate_account
    update(account_status: 0)
  end

  def deactivate_account
    update(account_status: 1, password: User::DEFAULT_PASSWORD)
  end

  def apart_of_department?
    department.present?
  end
end
