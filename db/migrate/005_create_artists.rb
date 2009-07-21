class CreateArtists < ActiveRecord::Migration
  
  def self.up
    create_table :artists do |t|
      t.column "name", :string
      t.column "email", :string
      t.column "statement", :text
      t.column "cv_file", :string # file_column
      t.column "user_id", :integer #
       
    end
    
    add_index :artists, [:name], :unique
  end

  def self.down
    remove_index :artists, [:name]
    drop_table :artists
  end
end
