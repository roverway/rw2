module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  # for highlighter
  def render_body(body)
    RDiscount.new(coderay(body)).to_html
  end

  def coderay(text)
    text.gsub(/\<code(:(.+?))?\>(.+?)\<\/code\>/m).each do |match|
      CodeRay.scan($3.strip, $2).div(:line_numbers=>:table)
    end
  end

end
