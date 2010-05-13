class Article < ActiveRecord::Base

  #Associations
  #
  belongs_to :author
  has_many :comments, :dependent => :destroy
  has_many :likes
  has_many :fav_authors, :through => :likes, :source => :author

  #validations
  #
  validates_presence_of [:title, :body, :author], :message =>"is required"

  #callbacks
  #
  def before_save
    date_posted = DateTime.new if status.eql?("Posted")
  end

  #name scopes
  #
  named_scope :latest, :conditions => {:status => 'Posted'},
                       :order      => 'date_posted DESC'
  #Class Methods
  def self.statuses
    ["Draft","Posted"]
  end
  
  #instance methods
  #
  def is_posted?
    status == "Posted"
  end

end
