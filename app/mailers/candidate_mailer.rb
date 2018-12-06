class CandidateMailer < ApplicationMailer
	default from: "Franchise Inquiry Website Form <noreply@woofgangbakery.com>"
	default subject: "Franchise Inquiry from Website"

	def new_candidate(candidate)
	  @candidate = candidate

    mail(to: "kelli@hsdesignhouse.com", subject: "Franchise Inquiry Form from Website") do |format|
  	  format.html
  	  format.text
    end
	end
end
