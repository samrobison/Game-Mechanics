class Keyword < ActiveRecord::Base
	has_many :mechanics, class_name: "Mechanic"

	validates :title, presence: true

	accepts_nested_attributes_for :mechanics
end
