class ContestantEntry < ActiveRecord::Base
  
  belongs_to :contestant
  validates_presence_of :contestant
  
  has_many :votes
  
  has_attached_file :photo, :styles => { :medium => "240x360>", :thumb => "48x72>" }
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => 'image/jpeg'
  
end