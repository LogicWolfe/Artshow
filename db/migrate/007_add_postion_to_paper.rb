class AddPostionToPaper < ActiveRecord::Migration
  def self.up
    add_column :papers, :position, :integer
  end

  def self.down
    remove_column :papers, :postion
  end
end
