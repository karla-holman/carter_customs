module Admin
	class AdminController < ApplicationController
		before_filter :validate_user

		def validate_user
			true
		end
	end
end