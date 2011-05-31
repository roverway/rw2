module ApplicationHelper

  def tagcloud
    @tags = Post.tag_counts_on(:tags)
    return @tags
  end
end
