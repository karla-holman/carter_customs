class AdminController < ApplicationController
  before_filter :store_location
  before_filter :authorized?
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format =~ %r{application/json}  }
  
  def update_positions
    ActiveRecord::Base.transaction do
      params[:positions].each do |id, index|
        model_class.find(id).set_list_position(index)
      end
    end

    respond_to do |format|
      format.js { render text: 'Ok' }
    end
  end

  protected 

  # Index request for JSON needs to pass a CSRF token in order to prevent JSON Hijacking
  def check_json_authenticity
    return unless request.format.js? or request.format.json?
    return unless protect_against_forgery?
    auth_token = params[request_forgery_protection_token]
    unless (auth_token and form_authenticity_token == URI.unescape(auth_token))
      raise(ActionController::InvalidAuthenticityToken)
    end
  end

  private
  def authorized?
    unless spree_current_user && (spree_current_user.has_spree_role? "admin")
      flash[:error] = "You are not authorized to view that page. Please log in to continue."
      redirect_to spree_login_path
    end
  end

  def store_location
	  # store last url as long as it isn't a /users path
	  session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
	end

	def after_sign_in_path_for(resource)
	  session[:previous_url] || root_path
	end

end