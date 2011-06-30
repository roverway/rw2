module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  # a helper mathod for highlighter 
  # highlight process happens between get date out from the datebase, and rendered by the browser
  # a nother method for highlight code is  write a before_save mathod,
  # which colored the code before it being storing into the datebase
  # and the view just get a colored normal html content.
  def render_body(body)
    RDiscount.new(coderay(body)).to_html.html_safe
  end
  def coderay(text)
    text.gsub(/\<code(:(.+?))?\>(.+?)\<\/code\>/m).each do |match|
      CodeRay.scan($3.strip, $2).div(:line_numbers=>:table)
    end
  end

end
