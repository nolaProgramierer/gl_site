class HomeController < ApplicationController


  def index
    @contact = Contact.new(params[:contact])
  end

  def contact
    @contact = Contact.new(params[:contact])
    @contact.request = request
    respond_to do |format|
    if @contact.deliver
      # re-initialize Contact object for cleared format
      @contact = Contact.new
      format.html { render 'index'}
      format.js   { flash.now[:notice] = @message = "Thank you for your message. I'll get back to you soon!" }
    else
      format.html { render 'index' }
      format.js   { flash.now[:error] = @message = "Message did not send." }
      end
    end
  end
end
