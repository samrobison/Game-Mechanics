class KeywordsController < ApplicationController

def show
	@keyword = Keyword.find(params[:id])
	#cheating
	@keys = Keyword.where{title =~ my{@keyword.title}}
end

end
