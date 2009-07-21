class ArtController < ApplicationController
  layout "artshow_layout"

  #
  #
  # Only supports Single Artist
  # Refactoring of Paper_controller into Art
  #
  #
  def statement
    
  end
  def details
       @apaper = ArtPaper.find_by_id(params[:id])

       respond_to do |format|

       format.json { render :json => @apaper.to_json, 
                            :callback => 'switch_details' }
     end
   end
  def show
    index = params[:id].to_i
  
    @collection_list = collection_papers
    @apaper = @collection_list[index]
  end
  
  def collection_papers
     collection_representatives = Paper.find_by_sql("select * from papers where id in (select min(id) from papers group by paper_pile_id)")     
  end

end
