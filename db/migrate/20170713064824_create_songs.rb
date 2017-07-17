class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
    	
    	t.string :song_title  
    	t.string :song_url 

      t.timestamps null: false
    end
  end	
end
#Title – The track title
#Artist – The artist that recorded the track
#Album – Which album the track belongs to (if applicable
#Track – The track number from the album (if applicable)
#Year – The year that the track was published
#Genre – The type of track, e.g. speech, rock, pop
#Comment – Additional notes about the track
#Copyright – Copyright notice by the copyright holder
#Album Art – Thumbnail of the album art or artist