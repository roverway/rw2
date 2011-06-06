class Post < ActiveRecord::Base
  has_many :comments, :as => :commentable, :dependent => :destroy

  acts_as_taggable_on :tags

  scope :by_date, :order => "created_at DESC"



end
