class MechanicsController < ApplicationController
	def new
		@mechanic = Mechanic.new

		3.times do
			@mechanic.examples.build
		end
		#@mehcnaic.examples = Hash.new { |hash, key| hash[key] = Example.new }
		
		mechies = Mechanic.all
		if mechies.length < 3
			mechies.length.times do
				@mechanic.related_mechanics.build
			end
		else 
			3.times do
				@mechanic.related_mechanics.build
			end
		end

		@array = Array.new
		@array.push(["N/A", 0])
		mechies.each do |x|
			@array.push([x.name, x])
		end


		3.times do
			@mechanic.keywords.build
		end
		3.times do
			@mechanic.notes.build
		end 
	end
	
	def create
		
		params[:mechanic][:examples_attributes].each do |k,x|
			if !x[:title]  && !x[:text] && !x[:link] && !x[:thumbnail]
				params[:mechanic][:examples_attributes].delete(k)
			end
		end
		params[:mechanic][:keywords_attributes].each do |k,x|
			if !x[:text]
				params[:mechanic][:keywords_attributes].delete(k)
			end
		end
		params[:mechanic][:notes_attributes].each do |k,x|
			if !x[:text]
				params[:mechanic][:notes_attributes].delete(k)
			end
		end
		byebug
		@mechanic = Mechanic.new(params[:mechanic].permit!)
		if @mechanic.save
			@mechanic.save!
			redirect_to newMechanic
		else
			render 'new'
		end


	end

end
