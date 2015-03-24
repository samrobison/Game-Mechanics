class KeywordsController < ApplicationController

def show
	@keyword = Keyword.find(params[:id])
	@links = @keyword.mechanics
end

end
