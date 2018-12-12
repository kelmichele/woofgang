class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

	def new
    @contact = Contact.new

    @locations = Location.all
    @ct = Location.where(state: "CT")
    @fl = Location.where(state: "FL")
    @ga = Location.where(state: "GA")
    @ks = Location.where(state: "KS")
    @nc = Location.where(state: "NC")
    @nj = Location.where(state: "NJ")
    @nv = Location.where(state: "NV")
    @ny = Location.where(state: "NY")
    @sc = Location.where(state: "SC")
    @tn = Location.where(state: "TN")
    @tx = Location.where(state: "TX")
    @va = Location.where(state: "VA")

    @choices =  ['Connecticut', 'Florida', 'Georgia', 'Kansas', 'Nevada', 'New Jersey', 'New York', 'North Carolina', 'South Carolina', 'Tennesse', 'Texas', 'Virginia']
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
