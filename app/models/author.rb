class Author < ActiveRecord::Base

  #Associations
  #
  has_many :articles

  #Validations
  #
  acts_as_authentic
  validates_presence_of [ :last_name, :first_name, :email,:login ], :message =>"is required"
  validates_uniqueness_of :email, :login
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  
  #Instance methods
  #
  def full_name
    return "#{first_name} #{last_name}"
  end
  
end
