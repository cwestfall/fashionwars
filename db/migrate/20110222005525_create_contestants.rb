class CreateContestants < ActiveRecord::Migration
  def self.up
    create_table :contestants do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.decimal :score, :null => false, :scale => 2
      t.text :bio
      t.timestamps
    end
    Contestant.create(:first_name => 'Ryan',  :last_name => 'Edwards',    :score => 1.0)
    Contestant.create(:first_name => 'Chad',  :last_name => 'Westfall',   :score => 1.5)
    Contestant.create(:first_name => 'Jake',  :last_name => 'Issac',      :score => 1.0)
    Contestant.create(:first_name => 'Gagan', :last_name => 'Chaudhari',  :score => 1.5)
    Contestant.create(:first_name => 'Azeem', :last_name => 'Maherali',   :score => 2.0)
  end

  def self.down
    drop_table :contestants
  end
end
