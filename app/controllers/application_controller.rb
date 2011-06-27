class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  #prepend_view_path("#{Rails.root}/themes/#{THEMENAME}/views")
  #@cached[theme_name] ||= ActionView::Base.process_view_paths(theme_path)
  #self.view_paths = ActionController::Base.view_paths.dup.unshift @cached[theme_name]
  
  theme :cur_theme

  private

  def cur_theme
    #$THEMENAME ||= "greader" 
    session[:theme] ||= "fanfou"
  end

end
