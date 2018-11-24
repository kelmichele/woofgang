class VendorMailer < ApplicationMailer
	default from: "Vendor Relations Form from Website <noreply@woofgangbakery.com>"
	default subject: "Vendor Relations Form from Website"

	def new_vendor(vendor)
	  @vendor = vendor

	  mail subject: "Vendor Relations Form from Website"
	  mail to: "kelli@hsdesignhouse.com"
	end
end
