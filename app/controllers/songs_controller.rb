class SongsController < ApplicationController

	skip_before_filter :authenticate_user!, :only => :play

	def index
		@u=current_user
		@songs=@u.songs.order("LOWER(song_title)")
	end

	def play
		if params[:q].present?
			@songs=Song.where("song_title like ?", "%#{params[:q]}%").order("LOWER(song_title)")
		else
			@songs=Song.all.order("LOWER(song_title)")
		end
	end

	def new
		@song=Song.new
	end

	def create
		@song = current_user.songs.new(song_params)
		@song.song_title = params[:song][:song_url].original_filename if params[:song][:song_url].present?
		if @song.save
			redirect_to songs_path,notice: "The song #{@song.song_title} has been uploaded"
		else
			render "new"
		end
	end

	def download
		@song = Song.find(params[:id])
		 send_file(@song.song_url.path,
          :type => @song.song_url.content_type,
          :disposition => 'attachment',
          :url_based_filename => true)
	end

	def destroy		
		@song=Song.find(params[:id])
		@song.destroy
		redirect_to songs_path, notice: "The song has been deleted"
	end

	private
	def song_params
		params.require(:song).permit(:song_title, :song_url, :mood_list)
	end

end
