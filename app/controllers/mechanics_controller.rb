class MechanicsController < ApplicationController
	

	def new
		#defines how many examples keywords and notes will be built
		@ex = 5
		@ke = 5
		@no = 5
		#count variable used to hide certain entries
		@ecount = 0
		@kcount = 0
		@ncount = 0
		#creates temporary new mechanic
		@mechanic = Mechanic.new

		@ex.times do
			@mechanic.examples.build
		end
		#@mehcnaic.examples = Hash.new { |hash, key| hash[key] = Example.new }
		
		mechies = Mechanic.all

		if mechies.length < 3
			(mechies.length).times do
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
			@array.push([x.name, x.name])
		end


		@ke.times do
			@mechanic.keywords.build
		end
		@no.times do
			@mechanic.notes.build
		end 
	end
	
	def create
		#select array for related mechanics just in case it fails 
		mechies = Mechanic.all
		@array = Array.new
		@array.push(["N/A", 0])
		
		mechies.each do |x|
			@array.push([x.name, x.name])
		end
		
		#clear out blank entries from the mechanic
		params[:mechanic][:examples_attributes].each do |k,x|
			if x[:title] == "" && x[:text] == "" && x[:link] = "" && !x[:thumbnail] #&& params[:mechanic][:examples_attributes].length >= 1
				params[:mechanic][:examples_attributes].delete(k)
			end
		end

		#this needs to updated at some point to search through all the keywords and use that one if it exists 
		if params[:mechanic][:keywords_attributes]
			params[:mechanic][:keywords_attributes].each do |k,x|
				if x[:title] == ""
					params[:mechanic][:keywords_attributes].delete(k)
				end
				#x.mechanics = @mechanic
			end
		end
		
		if params[:mechanic][:notes_attributes]
			params[:mechanic][:notes_attributes].each do |k,x|
				if x[:text] == ""
					params[:mechanic][:notes_attributes].delete(k)
				end
			end
		end
		
		if params[:mechanic][:related_mechanics_attributes]
			params[:mechanic][:related_mechanics_attributes].each do |k,x|
				if x[:title] == "0"
					params[:mechanic][:related_mechanics_attributes].delete(k)
				end
			end
		end

		#create mechanic  
		@mechanic = Mechanic.new(params[:mechanic].permit!)
	

		#add existing keywords to array and delete them so they aren't made twice
		(0..((@mechanic.keywords.length) -1)).each do |i|
			if Keyword.where(title: @mechanic.keywords[0][:title]).length != 0
				 temp = @mechanic.keywords[0][:title]
				 @mechanic.keywords.delete(@mechanic.keywords[0])
				 @mechanic.keywords.push(Keyword.where(title: temp).first)
			end
		end
		#do the same for related mechanics
		#for i in 0..(@mechanic.related_mechanics.length -1)
		(0..((@mechanic.related_mechanics.length) -1)).each do |i|
			if Mechanic.where(name: @mechanic.related_mechanics[i][:title]).length != 0
				@mechanic.related_mechanics[i].mechanic = Mechanic.where(name: @mechanic.related_mechanics[i][:title]).first
			else
				@mechanic.related_mechanics[i] = nil
			end
		end
		#clear nill entries
		@mechanic.related_mechanics.each do |x|
			unless x
				@mechanic.related_mechanics.delete(x)
			end		
		end
					
		#add existing related mechanics to the mechan
		if @mechanic.save
			@mechanic.save!

			redirect_to @mechanic
		else
			#clear out keywords 
			(0..((@mechanic.keywords.length) -1)).each do |i|
			 	 @mechanic.keywords.push(Keyword.new( title: @mechanic.keywords[0][:title]))
				 @mechanic.keywords.delete(@mechanic.keywords[0])
			end
			@ex = 5
			@ke = 5
			@no = 5
			@ecount = 0
			@kcount = 0
			@ncount = 0
			#select the amount of entries to be hidden
			if @mechanic.examples.length > 0
				@ecount = 1 - @mechanic.examples.length
			end

			if @mechanic.keywords.length > 0
				@kcount = 1 - @mechanic.keywords.length
			end
			
			if @mechanic.notes.length > 0
				@ncount = 1 - @mechanic.notes.length
			end
			#make the proper amount of entries
			while @mechanic.examples.length < @ex do
				@mechanic.examples.build
			end

			while @mechanic.keywords.length < @ke do
				@mechanic.keywords.build
			end

			while @mechanic.notes.length < @no do
				@mechanic.notes.build
			end
			byebug
			render 'new'
		end


	end

	def show
		@mechanic = Mechanic.find(params[:id])
		@name = @mechanic.name
		@description = @mechanic.text
		@examples = @mechanic.examples
		@related = @mechanic.related_mechanics
		@keywords = @mechanic.keywords
		@notes = @mechanic.notes
	end

end
