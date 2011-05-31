class Post < ActiveRecord::Base
  has_many :comments, :as => :commentable
  acts_as_taggable_on :tags
end
