class ArtPaper < Paper

  def collection
    self.paper_pile.papers
  end
  

  def to_json
  {
     :attributes => { 'name' => self.name, 'description' =>self.description, 'image' => image_url, 'materials' =>self.materials, 'year' => self.year  }
  }.to_json
end
end
