class Contestant < ActiveRecord::Base
  has_many :contestant_entries
  
  validates_presence_of :first_name, :last_name, :score
  validates :score, :numericality => true
  
  def full_name
    self.first_name + ' ' + self.last_name
  end
  
end