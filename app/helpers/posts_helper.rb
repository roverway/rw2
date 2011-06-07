module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  # for highlighter
  def render_body(body)
    RDiscount.new(coderay(body)).to_html
  end
  def coderay(text)
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
      CodeRay.scan($3, $2).div
    end
  end

end
