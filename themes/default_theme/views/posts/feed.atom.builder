atom_feed do |feed|
  feed.title @title 
  feed.updated @updated

  @posts.each do |post|
    feed.entry post do |entry|
      entry.title post.title
      entry.content render_body(post.body), :type=>"html" 
      entry.author do |author|
        author.name @author 
      end

    end
  end
end
