class Post < ActiveRecord::Base
  has_many :comments, :as => :commentable, :dependent => :destroy
  acts_as_taggable_on :tags

  scope :by_date, :order => "created_at DESC"

  has_friendly_id :title, :use_slug => true

  #before_save :render_body
  # for highlighter
  #def render_body
    #self.body = RDiscount.new(coderay(self.body)).to_html
  #end

  #def coderay(text)
    #text.gsub(/\<code(:(.+?))?\>(.+?)\<\/code\>/m).each do |match|
      #CodeRay.scan($3.strip, $2).div(:line_numbers=>:table)
    #end
  #end




end
