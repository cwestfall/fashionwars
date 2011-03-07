class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :contestant_entry
  
  validates_presence_of :contestant_entry
  validates_uniqueness_of :id, :scope => [:date, :user_id]
  
  def find_winner_by_date(date)
    
  end
end
