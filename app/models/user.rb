class User < ApplicationRecord
  belongs_to :campus
  belongs_to :department, optional: true 

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  enum account_status: [:activated, :deactivated]
  enum account_type: [:staff_member, :student, :staff_admin]
  
  attr_writer :login
 
  DEFAULT_PASSWORD = 'password1'
  GENDER = ['Male', 'Female']

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates_presence_of :title, :first_name, :last_name, :gender, :account_type
  validate :cant_assign_student_to_department

  def login
    @login || self.uwi_id || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["uwi_id = :value", { :value => login }]).first
    elsif conditions.has_key?(:uwi_id) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

  def activate_account
    update(account_status: 0)
  end

  def deactivate_account
    update(account_status: 1, password: User::DEFAULT_PASSWORD)
  end

  def apart_of_department?
    department.present?
  end

  def initials
    "#{first_name.first}#{last_name.first}"
  end

  def name
    "#{first_name} #{last_name}"
  end

  def cant_assign_student_to_department
    if account_type == User.account_types.key(1) and department_id.present?
      errors.add(:department, "Student can't be assigned to a department")
      department = ""
    end
  end
end
