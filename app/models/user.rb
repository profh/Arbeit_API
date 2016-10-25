class User < ActiveRecord::Base
  # Use built-in rails support for password protection
  has_secure_password
    
  # Relationships
  # -----------------------------
  has_many :assignments
  has_many :projects, through: :assignments
  has_many :completed_tasks, class_name: "Task", foreign_key: "completed_by"
  has_many :created_tasks, class_name: "Task", foreign_key: "created_by"

  # Scopes
  # -----------------------------
  scope :alphabetical, -> { order("last_name, first_name") }
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }
  
  # Validations
  # -----------------------------
  # make sure required fields are present
  validates_presence_of :first_name, :last_name, :email  
  validates_uniqueness_of :email, allow_blank: true
  validates_format_of :email, :with => /\A[\w]([^@\s,;]+)@(([a-z0-9.-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, :message => "is not a valid format", :allow_blank => true
  validates_presence_of :password, on: :create 
  validates_presence_of :password_confirmation, on: :create 
  validates_confirmation_of :password, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true
  
  # Other methods
  # -----------------------------  
  def proper_name
    first_name + " " + last_name
  end
  
  def name
    last_name + ", " + first_name
  end

  # *** ADDING THE AUTH TOKEN ***
  # for demo, initially the token is set to nil...
  # def auth_token
  #   nil
  # end

  # really want it as a callback...
  before_create :generate_auth_token

  def generate_auth_token
    self.auth_token = SecureRandom.hex
  end

  # for use in authorizing with CanCan
  ROLES = [['Administrator', :admin],['Member', :member]]

  def role?(authorized_role)
    return false if role.nil?
    role.downcase.to_sym == authorized_role
  end

  # login by email address
  def self.authenticate(email, password)
    find_by_email(email).try(:authenticate, password)
  end

end
