class ContactMailer < ApplicationMailer
	default from: "Inquiry from Website <noreply@woofgangbakery.com>"
	default subject: "Inquiry from Website"

	def new_contact(contact)
	  @contact = contact

	  mail(to: "kelli@hsdesignhouse.com", subject: "Inquiry from Website") do |format|
		  format.html
		  format.text
	  end
	end
end
