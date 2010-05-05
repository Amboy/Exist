class Comment < ActiveRecord::Base

  #Associations
  #
  belongs_to :article

  #Validations
  #
  validates_presence_of [:email, :body], :message =>"is required"
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  #Instance Methods
  #
  def delete_this_comment author
    case author
      when Author
        author
      when String, Integer
        author = Author.find(author)
      else
        raise "invalid parameter #{author}."
     end 
    delete if article(true).author(true) == author
  end
end
