class VendorsController < ApplicationController
	def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)

    if @vendor.valid? && @vendor.save
      VendorMailer.new_vendor(@vendor).deliver unless vendor_params[:honey].present?
      redirect_to vendor_path, notice: "Your vendor relations form has been sent. Thank you for reaching out."
    else
      render :new
    end
  end

  private
    def vendor_params
      params.require(:vendor).permit(:name, :email, :phone, :address, :company, :website, :category, :product, :big_box, :order_min, :wholesale_price, :source, :shipping, :msrp, :honey)
    end
end
