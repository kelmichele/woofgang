class EstatesController < ApplicationController
	def new
    @estate = Estate.new
  end

  def create
    @estate = Estate.new(estate_params)

    if @estate.valid? && @estate.save
      EstateMailer.new_estate(@estate).deliver unless estate_params[:honey].present?
      redirect_to real_estate_submissions_path, notice: "Your real estate form has been sent. Thank you for reaching out."
    else
      render :new
    end
  end

  private
    def estate_params
      params.require(:estate).permit(:company, :first_name, :last_name, :address, :address2, :city, :county, :state, :zip, :email, :phone, :landlord, :est_address, :est_address2, :est_city, :est_county, :est_state, :est_zip, :est_develop, :est_footage, :est_type, :est_timeframe, :grapevine, :other, :source, :honey)
    end
end
