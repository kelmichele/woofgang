class EstateMailer < ApplicationMailer
	default from: "Real Estate Submission Website Form <noreply@woofgangbakery.com>"
	default subject: "Real Estate Submission from Website"

	def new_estate(estate)
	  @estate = estate

	  # mail to: "cara@woofgangbakery.com"
	  mail(to: "kelli@hsdesignhouse.com", subject: "Real Estate Submission from Website") do |format|
  	  format.html
  	  format.text
    end
	end
end
