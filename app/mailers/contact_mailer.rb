class ContactMailer < ApplicationMailer
	default from: "Contact Form from Website <noreply@woofgangbakery.com>"
	default subject: "Contact Form from Website"

	def new_contact(contact)
	  @contact = contact

	  mail(to: "kelli@hsdesignhouse.com", subject: "Contact Form from Website") do |format|
		  format.html
		  format.text
	  end
	end
end
