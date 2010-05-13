class Like < ActiveRecord::Base
  # Associations
  #
  belongs_to :author
  belongs_to :article

  # validations
  #
  validates_presence_of [:author_id, :article_id], :message =>"is required"
end
