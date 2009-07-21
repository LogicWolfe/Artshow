# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
 require_dependency "login_system"
class ApplicationController < ActionController::Base
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_ArtShow_session_id'
  include LoginSystem 
  
  ArtistController.init
  
  def artist
    @artist = ArtistController.init
  end
end
