class ContestantEntry < ActiveRecord::Base
  
  belongs_to :contestant
  validates_presence_of :contestant
  
  has_many :votes
  
  has_attached_file :photo, :styles => { :xl => "480x720>", :large => "320x480>", :medium => "240x360>", :thumb => "48x72>" }
  validates_attachment_presence :photo
  validates_attachment_content_type :photo, :content_type => 'image/jpeg'
  
end