class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  valdiates :body, presence: true 
end
