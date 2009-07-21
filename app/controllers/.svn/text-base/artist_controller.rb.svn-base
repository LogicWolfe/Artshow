class ArtistController < ApplicationController
  layout "scaffold"
  before_filter :login_required , :execpt => [:contact, :cv, :init]

  #
  #
  # This is for Hardcoding a single Artist into the Application
  #
  #
  class << self
    def init
      @@artist = nil
      @@artist = Artist.find(1) rescue nil
      if @@artist.nil?
        # Only one artist for now
        #
        @@artist = Artist.new({:name =>'Default Artist',:email =>'default@email.com'})                
        #
        # Ensure there is a User account for this Artist
        ## hack
        #       
        user = User.new(:login => @@artist.name, :password => 'this_is_not_secure',:password_confirmation =>'this_is_not_secure')
        @@artist.user = user
        unless @@artist.save
          raise "Couldn't Create Default Artist"
        end
      end   
      @@artist 
    end
  end  

  def cv
    artist
    send_file @artist.cv_file, :type => 'text/unknown', :disposition => 'inline'
  end

  def contact
    artist
  end
  
  
  def show
    artist
  end
  
  def index
    show
    render :action => 'show'
  end
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
         :redirect_to => { :action => :show }

  def list
    index
  end

 

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(params[:artist])  
    if @artist.save
      flash[:notice] = 'Artist was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    @user = User.find(@artist.user_id)    
    if @artist.update_attributes(params[:artist])
      @user.change_login( @artist.name )
      flash[:notice] = 'Artist was successfully updated.'
      redirect_to :action => 'show', :id => @artist
    else
      render :action => 'edit'
    end
  end

  
end
