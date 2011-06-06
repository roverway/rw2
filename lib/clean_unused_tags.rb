#! /usr/bin/env ruby

def clear_unused_tags
  Tag.all.each do |tag|
    unless Tagging.find_by_tag_id(tag.id)
      Tag.delete(tag.id)
    end
  end
end

