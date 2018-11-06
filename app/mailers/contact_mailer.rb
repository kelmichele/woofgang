class ContactMailer < ApplicationMailer
	default from: "Contact Form from Website <noreply@woofgangbakery.com>"
	default subject: "Contact Form from Website"

	def new_contact(contact)
	  @contact = contact

	  mail subject: "Contact Form from Website"
	  mail to: "kelli@hsdesignhouse.com"
	end
end