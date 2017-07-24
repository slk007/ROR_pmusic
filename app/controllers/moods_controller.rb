class MoodsController < ApplicationController
	def show
		@mood=Mood.find(params[:id])
	end

	def index
		@moods=Mood.all
	end
end
