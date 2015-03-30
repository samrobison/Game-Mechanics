class SearchController < ApplicationController
  def results
 	searchKey = '%' + params[:search]
 	@keys = Keyword.where{title =~ my{searchKey}}
 	@mechanics = Mechanic.where{name =~ my{searchKey}}
 	@examples = Example.where{title =~ my{searchKey}}
 	@examples.each do |x|
 		@mechanics.push(Mechanic.find(x.mechanic_id))
 	end
 	@foundSomething = false
 	if @keys.length > 0 
 		@foundSomething = true
 	elsif @mechanics.length > 0
 		@foundSomething = true
 	end
 			
  end
end
