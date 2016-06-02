class InfoController < ApplicationController
	def home
		# For web contact
		@contact = Contact.new
		@products = Spree::Product.all
	end

	# POST Contact
	def contact
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
    	redirect_to :home
    else
      flash.now[:error] = 'Cannot send message.'
      redirect_to :home
    end
  end
end
