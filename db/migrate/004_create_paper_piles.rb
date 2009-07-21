class CreatePaperPiles < ActiveRecord::Migration
  def self.up
    create_table :paper_piles do |t|
      t.column "name", :string
      t.column "visible", :boolean
    end
    add_index :paper_piles, [:name], :unique
  end

  def self.down
    remove_index :paper_piles, [:name]
    drop_table :paper_piles
  end
end
