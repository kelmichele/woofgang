class ContactsController < ApplicationController

	def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid? && @contact.save
      ContactMailer.new_contact(@contact).deliver unless contact_params[:honey].present?
      redirect_to contact_path, notice: "Your form has been sent. Thank you for reaching out."
    else
      render :new
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :location, :singup, :grapevine, :content, :honey)
    end
end
