class VendorMailer < ApplicationMailer
	default from: "Product Submission Form from Website <noreply@woofgangbakery.com>"
	default subject: "Product Submission"

	def new_vendor(vendor)
	  @vendor = vendor

	  # products@woofgangbakery.com
    mail(to: "kelli@hsdesignhouse.com", subject: "Product Submission") do |format|
  	  format.html
  	  format.text
    end
	end
end
