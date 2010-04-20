class Comment < ActiveRecord::Base
  belongs_to :article
  validates_presence_of [:email, :body], :message =>"is required"
end
