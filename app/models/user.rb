class User < ApplicationRecord
  belongs_to :campus
  has_many :course_records

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  enum account_status: [:activated, :deactivated]
  enum account_type: [:staff_member, :student, :staff_admin]
  
  attr_writer :login
 
  DEFAULT_PASSWORD = 'password1'
  GENDER = ['Male', 'Female']

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
  validates_presence_of :title, :first_name, :last_name, :gender, :account_type

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

  def initials
    "#{first_name.first}#{last_name.first}"
  end

  def name
    "#{first_name} #{last_name}"
  end

  def has_permission_group?
    permission_group.present?
  end

  def permission_group
    PermissionGroup.find(permission_group_id)
  end

  def self.students
    self.where(account_type: User.account_types[:student])
  end

  def can_create?(department_id)
    records = permission_group.permissions.where(department_id: department_id)
    if records.present?
      records.first.can_create? 
    end
  end

  def can_update?(department_id)
    records = permission_group.permissions.where(department_id: department_id)
    if records.present?
      records.first.can_update?
    end
  end

  def can_discontinue?(department_id)
    records = permission_group.permissions.where(department_id: department_id)
    if records.present?
      records.first.can_discontinue?
    end
  end
end
