module ApplicationHelper

	def active_tab tab=nil
		if tab == 'home'
			return "active" if controller_name == "index" && action_name == "show"
		elsif tab == 'your_list'
			return "active" if controller_name == "songs" && action_name == "index"
		elsif tab == 'mood'
			return "active" if controller_name == "moods" && action_name == "index"
		elsif tab == 'play'
			return "active" if controller_name == "songs" && action_name == "play"
		elsif tab == 'upload'
			return "active" if controller_name == "songs" && action_name == "new"
		else
			return ""
		end
	end
end
