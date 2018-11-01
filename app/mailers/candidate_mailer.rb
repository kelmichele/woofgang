class CandidateMailer < ApplicationMailer
	default from: "Franchise Inquiry Website Form <noreply@woofgangbakery.com>"
	default subject: "Franchise Inquiry from Website"

	def new_candidate(candidate)
	  @candidate = candidate

	  mail subject: "Franchise Inquiry from Website"
	  mail to: "kelli@hsdesignhouse.com"
	end
end
