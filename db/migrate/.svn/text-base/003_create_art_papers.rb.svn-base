class CreateArtPapers < ActiveRecord::Migration
  # name => type
  COLUMNS={
    :materials => :string,
    :year => :integer,
    :price => :integer,
    :description => :text,   
  }

  def self.up
    COLUMNS.each {|name,type|
      add_column :papers, name ,type
    }
  end

  def self.down
    COLUMNS.each {|name,type|
      remove_column :papers, name 
    }
  end
end
