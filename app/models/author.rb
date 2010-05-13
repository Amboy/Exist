class Author < ActiveRecord::Base

  #Associations
  #
  has_many :articles, :dependent => :destroy
  has_many :likes
  has_many :fav_articles, :through => :likes, :source => :article
  
  #Plugins
  #
  acts_as_authentic {|c| c.login_field = :login }
  
  #Validations
  #
  
  validates_presence_of [ :last_name, :first_name, :email,:login ], :message =>"is required"
  validates_uniqueness_of :email, :login
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  
  #Instance methods
  #
  def full_name
    return "#{first_name} #{last_name}"
  end
  
end
