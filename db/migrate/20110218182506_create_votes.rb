class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.text :comment
      t.date :date, :null => false
      t.integer :user_id, :null => false
      t.integer :contestant_entry_id, :null => false
      t.timestamps
    end
    
    add_index(:votes, [:date, :user_id], :unique => true)
  end

  def self.down
    drop_table :votes
  end
end
