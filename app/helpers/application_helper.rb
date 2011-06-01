module ApplicationHelper
    #$tags = Post.tag_counts_on(:tags)
  def tagcloud
    @tags = Post.tag_counts_on(:tags)
    return @tags
  end
end
