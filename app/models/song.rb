class Song < ActiveRecord::Base

	mount_uploader :song_url, AvatarUploader

	#after_destroy :delete_image_folder

	validates :song_title, presence: true
	validates :song_url, presence: true

	belongs_to :user

	has_many :taggings
	has_many :moods, through: :taggings

	def mood_list
		self.moods.collect do |mood|
			mood.name
		end.join(", ")
	end

	def mood_list=(moods_string)
		mood_names=mood_string.split(",").collect{|s| s.strip.downcase}.uniq
		new_or_found_moods=mood_names.collect{|name| Mood.find_or_create_by(name: name)}
		self.moods=new_or_found_moods
	end


	#def delete_image_folder
		#p "====================="
      #FileUtils.remove_dir(File.join(Rails.root, File.join( 'public' , self.file_name.store_dir)), :force => true)  
   # end

end
