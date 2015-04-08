class Example < ActiveRecord::Base
	validates :text, presence: true
	validates :title, presence: true
	validates :link, presence: true
	#paperclip
	#attr_accessible :thumbnail
  	has_attached_file :thumbnail, :styles => { :medium => "300x300>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :thumbnail, :content_type => /\Aimage\/.*\Z/
  	validates :thumbnail, :attachment_presence => true
	validates_with AttachmentPresenceValidator, :attributes => :thumbnail
	validates_with AttachmentSizeValidator, :attributes => :thumbnail, :less_than => 1.megabytes
	validates_attachment_file_name :thumbnail, :matches => [/png\Z/, /jpe?g\Z/]
end
