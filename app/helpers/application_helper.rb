module ApplicationHelper
    #$tags = Post.tag_counts_on(:tags)
  def tagcloud
    @tags = Post.tag_counts_on(:tags)
    return @tags
  end

  def post_counter(category)
    Post.where("category=?",category).count
  end

  def find_post_by(comment)
    until comment.commentable_type=="Post" do
      comment = Comment.find(comment.commentable_id)
      find_post_by(comment)
    end
    Post.find(comment.commentable_id)
  end
end
