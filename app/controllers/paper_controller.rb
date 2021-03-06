class PaperController < ApplicationController
  layout "scaffold"
  before_filter :login_required
	
	def index
		list
		render :action => 'list'
	end
	def list	  
		@paper_pages, @papers = paginate :art_papers, :per_page => 5,:order =>'paper_pile_id'
		@paper_piles = PaperPile.find_all
	end
  def re_order_pile
 
      params["pile_#{params[:pile_id]}"].each_with_index do |id, position|
        Paper.update(id, :position => position+1)
      end
      render :nothing => true
    
  end
	def add
		@paper = ArtPaper.new
	end
	def delete
    ArtPaper.delete(params[:id])
    redirect_to :action => :list
	end
	def create
    @paper = ArtPaper.new(params[:paper])
    if params[:paper_pile]
      @paper_pile = PaperPile.find_by_name(params[:paper_pile][:name])
      @paper_pile = PaperPile.new(params[:paper_pile]) if @paper_pile.nil?   
      @paper.paper_pile = @paper_pile
    end
    if @paper.save
      flash[:notice] = 'ArtPaper was successfully created.'
      redirect_to :action => :list
    else
      render :action => 'add'
    end
  end
	def edit
	   @paper = ArtPaper.find(params[:id])
	end

  def update   
	 @paper = ArtPaper.find(params[:id])    
	   if params[:paper_pile]
       @paper_pile = PaperPile.find_by_name(params[:paper_pile][:name]) 
        if @paper_pile.nil? 
          @paper_pile = PaperPile.new(params[:paper_pile])     
          @paper_pile.save
       end
       params[:paper][:paper_pile_id] = @paper_pile.id
    end
    if @paper.update_attributes(params[:paper]) 
      flash[:notice] = 'ArtPaper was successfully updated.'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end
  
  #
  # This method is going to be a little hacky.
  # Since observer and autocomplete aren't so great together
  # this method will check to see if there are going to be more
  # than one match, it will not do anything until there are 0 or
  # 1 matches.. I think this should be a deterministic state.
  #
  # It returns a happy face on success and sad on failure and
  # probably something like a ? if it is still not working yet
  def update_or_create_pile_name_for
    raise ' Broken Idea  :D'
    paper_id = params[:id]
    pile_name = params[:pile_name]
    @paper_piles = PaperPile.find_all_like_name(pile_name)
    paper_piles_size = @paper_piles.size
    if paper_piles_size == 1
      # when size one.. we have a match
    elsif paper_piles_size == 0
      # when size zero, they may be still typing, or they may be done..
      #
      # if they are inventing the name of a new pile we are fucked.
      #
      # Ok.. i'm going to have to think about this.
    else # wait condition
            
    end
  end
	def show
		 @paper = ArtPaper.find(params[:id])
	end

	def in_collection
	  # Get Paper By Collection Name
	  # 
		@papers = PaperPile.find_by_name(params[:id]).papers
	end
	####
	#### AUTO COMPLETE AREA
	#
  # This is for the Paper Form Partial
  #
  #
  auto_complete_for :paper_pile, :name
  
  
  ##
  ## For multiple autocomplete of a Paper's PaperPile name on a single page
  ##
  #
  def auto_complete_with_index_for_paper_pile_name
      paper_pile = params[:paper_pile].keys[0] # get index as its always only one at a time
      auto_complete_responder_for_name params[:paper_pile][paper_pile][:name]
  end
  private
    def auto_complete_responder_for_name(value)
      
      @paper_piles = PaperPile.find_all_like_name(value)
      render :partial => 'paper_pile_list'
    end
  ## End multiple AutoComplete
  ####
end
