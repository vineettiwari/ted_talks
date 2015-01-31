class Comment < ActiveRecord::Base
  belongs_to :talk
  validates :body, presence: true 
end
