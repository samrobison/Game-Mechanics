class Mechanic < ActiveRecord::Base
	has_many :examples, class_name: "Example", :dependent => :destroy
	has_many :comments, class_name: "Comment", :dependent => :destroy
	has_many :related_mechanics, class_name: "RelatedMechanic", :dependent => :destroy
	has_many :keywords, class_name: "Keyword"
	has_many :notes, class_name: "Note", :dependent => :destroy

	validates :text, presence: true
	validates :name, presence: true
end
