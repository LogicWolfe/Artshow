require File.dirname(__FILE__) + '/../test_helper'
require 'paper_controller'

# Re-raise errors caught by the controller.
class PaperController; def rescue_action(e) raise e end; end

class PaperControllerTest < Test::Unit::TestCase

  def setup


    @controller = PaperController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_create_paper(options = {}, image_filename = 'files/test_create_paper.jpg')      
    
    pp_name = 'Hydraflower'
    pre_size = PaperPile.find_by_name(pp_name).papers.size 
    photo = fixture_file_upload(image_filename, 'image/jpg')
    post :create, {"paper" => {'image' => photo, 'name' => "Art", "tags" => 'clay fabric'},
                   "paper_pile" => {'name' => pp_name}}
    assert_redirected_to :controller => 'paper', :action => 'list'  
  
    assert_equal pre_size +1 , PaperPile.find_by_name(pp_name).papers.size 
  end
  
  def test_update_paper
    
    
    
    post :create, "paper" => {'name' => 'Art Garfunk',  "tags" => 'soup'}
    assert_redirected_to :controller => 'paper', :action => 'list'
    a = Paper.find_by_name('Art Garfunk')
    assert !a.nil?
    post :update, 'id' => a.id, "paper" => { 'name' => "Soup"}
    assert_redirected_to :controller => 'paper', :action => 'list'
    assert !flash[:notice].scan(/successfully/).empty?
  end
end
