class PaperPile < ActiveRecord::Base
  has_many :papers, :order => "position"
  
  class << self
    def find_all_like_name(value)
     param= value.downcase + '%'
      find_options= {
        :conditions => [ 'LOWER(name) LIKE ?', param ],
        :order => 'name ASC',
        :limit => 6
      }
      @paper_piles = PaperPile.find(:all, find_options)
    end
  end
end
