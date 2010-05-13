class Like < ActiveRecord::Base
  # Associations
  #
  belongs_to :author
  belongs_to :article

end