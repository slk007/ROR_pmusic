class Mood < ActiveRecord::Base

	has_many :taggings
	has_many :songs, through: :taggings

end
