atom_feed :language => 'en-US' do |feed|
  feed.title @title 
  feed.updated @updated

  @posts.each do |p|
    next if p.updated_at.blank?

    feed.entry(p) do |entry|
      entry.url post_url(p)
      entry.title p.title
      entry.content p.body 

      # the strftime is needed to work with Google Reader.
      entry.updated(p.updated_at.strftime("%Y-%m-%dT%H:%M:%SZ")) 
    end
  end
end
