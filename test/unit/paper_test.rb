require File.dirname(__FILE__) + '/../test_helper'

class PaperTest < Test::Unit::TestCase
  fixtures :papers

  # Replace this with your real tests.
  def test_fixture
    assert Paper.find_all_by_id(1).size == 1
  end
  def test_image_url
    paper = Paper.find_by_id(1)
    assert_equal "/paper/image/#{paper.id}/#{papers(:one)[:image]}", paper.image_url
  end
end
