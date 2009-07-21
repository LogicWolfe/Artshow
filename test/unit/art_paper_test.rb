require File.dirname(__FILE__) + '/../test_helper'

class ArtPaperTest < Test::Unit::TestCase
  fixtures :papers
  fixtures :paper_piles

  # Replace this with your real tests.
  def test_inheritance_w_fixtures
    pp = PaperPile.find_by_name('Rooted Soot')
    assert pp.papers.size == 1
  end
  def test_json_has_url_path
    apaper = ArtPaper.find(3)
    assert_equal apaper.to_json.scan(/image:\s\"(.+?)\"/).flatten.first, apaper.image_url 
  end
end
