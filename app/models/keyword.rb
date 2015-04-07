class Keyword < ActiveRecord::Base
	has_one :mechanic, class_name: "Mechanic"

	validates :title, presence: true

	accepts_nested_attributes_for :mechanic
end
