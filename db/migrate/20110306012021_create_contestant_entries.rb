class CreateContestantEntries < ActiveRecord::Migration
  def self.up
    create_table :contestant_entries do |t|
      t.date :date
      t.integer :contestant_id, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :contestant_entries
  end
end
