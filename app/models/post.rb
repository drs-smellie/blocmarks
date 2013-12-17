class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  has_many :favorites, dependent: :destroy
  
  default_scope order('created_at DESC')
end
