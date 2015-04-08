class Keyword < ActiveRecord::Base
	belongs_to :mechanic, class_name: "Mechanic"

	validates :title, presence: true

	accepts_nested_attributes_for :mechanic
end
