class VendorMailer < ApplicationMailer
	default from: "Vendor Relations Form from Website <noreply@woofgangbakery.com>"
	default subject: "Vendor Relations Inquiry from Website"

	def new_vendor(vendor)
	  @vendor = vendor

    mail(to: "kelli@hsdesignhouse.com", subject: "Vendor Relations Inquiry from Website") do |format|
  	  format.html
  	  format.text
    end
	  # mail to: "sam@woofgangbakery.com"
	end
end
