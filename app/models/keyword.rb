class Keyword < ActiveRecord::Base
	has_many :mechanics, class_name: "Mechanic"

	validates :title, presence: true
end
