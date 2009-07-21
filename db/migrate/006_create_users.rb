class CreateUsers < ActiveRecord::Migration
  def self.up
      create_table :users do |t|
                  t.column "login", :string
                  t.column "password",:string
      end

      add_index :users, [:login], :unique
    end


    def self.down
      
      remove_index :users, [:login]
      drop_table :users
      
    end
end
