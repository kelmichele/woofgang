class CandidateMailer < ApplicationMailer
	default from: "Franchise Inquiry Website Form <noreply@woofgangbakery.com>"
	default subject: "Franchise Inquiry"

	def new_candidate(candidate)
	  @candidate = candidate

	  # kelli@hsdesignhouse.com
    mail(to: "franchise@woofgangbakery.com,fsleadparser617@franchisesoftemails.com", subject: "Franchise Inquiry") do |format|
  	  format.html
  	  format.text
    end
	end
end
