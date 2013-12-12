class Topic < ActiveRecord::Base
  has_many :posts
  belongs_to :user

  default_scope order('created_at DESC')
end

