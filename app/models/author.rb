class Author < ActiveRecord::Base
  has_many :articles
  validates_presence_of [:last_name, :first_name, :email,:login], :message =>"is required"
  validates_uniqueness_of :email, :login
  acts_as_authentic
  def full_name
    return "#{first_name} #{last_name}"
  end
end
