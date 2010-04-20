class Author < ActiveRecord::Base
  has_many :articles
  validates_presence_of [:last_name, :first_name], :message =>"is required"
  def full_name
    return "#{first_name} #{last_name}"
  end
end
