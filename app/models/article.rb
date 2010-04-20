class Article < ActiveRecord::Base
  belongs_to :author
  has_many :comments
  validates_presence_of [:title, :body], :message =>"lastname and firstname are required"
  def self.statuses
    ["Draft","Posted"]
  end
  def before_save
    date_posted = DateTime.new if status.eql?("Posted")
  end
  def self.latest
    Article.find_by_status("Posted", :order => "date_posted DESC")
  end
  def isPosted?
    status == "Posted"
  end  
end
