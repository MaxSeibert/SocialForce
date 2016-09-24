class ContactController < ApplicationController
  def index

    #@contact = Contact.all
  end
  
  def success
    #@contactall = Contact.all
    #@c = Contact.all
    render :success
  end
  
  def new
    @contact = Contact.new
  end
  
   def create
    @contact = Contact.new(contact_params)
    #@contact.request = request
    if @contact.save #@abstract.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
      render :success
    else
      flash.now[:error] = 'Cannot send message.'
      render :index
    end
  end
  
  private
    def contact_params
      params.require(:'/contact').permit(:name,:email,:message)
    end
  
  
end
