class Song < ActiveRecord::Base
	mount_uploader :song_url, AvatarUploader
end
