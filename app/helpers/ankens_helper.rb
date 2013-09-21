module AnkensHelper
	def new_assignment_with(anken)
		"/assignments/new/#{anken.id}"
	end
end
