class MechanicController < ApplicationController

	def new
		@mechanic = Mechanic.new

		@mechanic.examples = Array.new(3, Example.new)
		@mechanic.related_mechanics = Array.new(5, RelatedMechanic.new)
		@mechanic.keywords = Array.new(5, Keyword.new)
		@mechanic.notes = Array.new(3, Note.new)
	end
end
