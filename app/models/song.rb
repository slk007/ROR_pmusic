class Song < ActiveRecord::Base
	mount_uploader :song_url, AvatarUploader
	validates :song_title, presence: true
	validates :song_url, presence: true
end
