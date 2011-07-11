module ApplicationHelper

  def tagcloud
    @tags = Post.tag_counts_on(:tags)
  end

  def post_counter(category_id)
    Post.where("category_id=?",category_id).count
  end

  def find_post_by(comment)
    until comment.commentable_type=="Post" do
      comment = Comment.find(comment.commentable_id)
      find_post_by(comment)
    end
    Post.find(comment.commentable_id)
  end

end
