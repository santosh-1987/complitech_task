class DashboardController < ApplicationController

	def index
		@writers=Writer.all
	end

end
