module Admin
	class AdminController < ApplicationController
		before_filter :validate_user

		def validate_user
			if spree_current_user && spree_current_user.admin?
				true
			else
				redirect_to root_path, :error => "Must be logged in as admin to access that page"
			end
		end
	end
end