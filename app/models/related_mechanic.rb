class RelatedMechanic < ActiveRecord::Base
	validates :title, presence: true

	has_one :mechanic, class_name: "Mechanic"

	accepts_nested_attributes_for :mechanic
end
