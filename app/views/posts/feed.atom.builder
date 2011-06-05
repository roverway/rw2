atom_feed do |feed|
  feed.title @title 
  feed.updated @updated

  @posts.each do |post|
    feed.entry post do |entry|
      entry.title post.title
      entry.content post.body, :type=>"html" 
      # the strftime is needed to work with Google Reader.
      entry.updated post.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ") 
      entry.author do |author|
        author.name "roverway" 
      end

    end
  end
end
