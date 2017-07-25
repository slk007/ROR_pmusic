class Song < ActiveRecord::Base

	mount_uploader :song_url, AvatarUploader

	after_destroy :delete_song_folder

	after_destroy :delete_moods

	validates :song_title, presence: true
	validates :song_url, presence: true

	belongs_to :user

	has_many :taggings, dependent: :destroy
	has_many :moods, through: :taggings, dependent: :destroy

	def mood_list
		self.moods.collect do |mood|
			mood.name
		end.join(", ")
	end

	def mood_list=(moods_string)
		mood_names=moods_string.split(",").collect{|s| s.strip.downcase}.uniq
		new_or_found_moods=mood_names.collect{|name| Mood.find_or_create_by(name: name)}
		self.moods=new_or_found_moods
	end

	def delete_moods
		@mood = Mood.all
		@mood.each do |m|
			unless Tagging.exists?(mood_id: m.id)
				m.destroy
			end
		end
	end

	def delete_song_folder			
    	FileUtils.remove_dir(File.join(Rails.root, File.join( 'public', self.song_url.store_dir)), :force => true)  
    end

end
