module AssignmentsHelper

	def new_member_for(assignment)
		"/assignments/assignmember/#{assignment.id}"
	end

end
