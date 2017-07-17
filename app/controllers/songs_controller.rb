class SongsController < ApplicationController

	def index
		@songs=Song.all
	end
	def new
		@song=Song.new
	end

	def create
		@song=Song.new(song_params)

		if @song.save
			redirect_to songs_path,notice: "The song #{@song.song_title} has been uploaded"
		else
			render "new"
		end
	end
	def destroy
		
		@song=Song.find(params[:id])
		@song.destroy
		redirect_to songs_path, notice: "The song has been deleted"
	end
	private
	def song_params
		params.require(:song).permit(:song_title, :song_url)
	end

end
