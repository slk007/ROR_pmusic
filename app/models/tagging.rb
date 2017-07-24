class Tagging < ActiveRecord::Base
  belongs_to :mood
  belongs_to :song
end
