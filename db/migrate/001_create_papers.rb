class CreatePapers < ActiveRecord::Migration
  def self.up
    create_table :papers do |t|
		t.column "name", :string
		t.column "image", :string
		t.column "tags", :string
		t.column "paper_pile_id", :integer
	  t.column "created_on", :date
    end
  end

  def self.down
    drop_table :papers
  end
end
