class IndexController < ApplicationController

	skip_before_filter :authenticate_user!, :only => :show
	
	def show

	end
end
