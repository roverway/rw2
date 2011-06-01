class Post < ActiveRecord::Base
  has_many :comments, :as => :commentable

  acts_as_taggable_on :tags
  named_scope :by_date, :order => "created_at DESC"
end
