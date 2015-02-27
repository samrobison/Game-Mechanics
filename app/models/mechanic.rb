class Mechanic < ActiveRecord::Base
	has_many :examples, class_name: "Example", :dependent => :destroy
	has_many :comments, class_name: "Comment", :dependent => :destroy
end
