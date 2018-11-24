class EstateMailer < ApplicationMailer
	default from: "Real Estate Submission Website Form <noreply@woofgangbakery.com>"
	default subject: "Real Estate Submission from Website"

	def new_estate(estate)
	  @estate = estate

	  mail subject: "Real Estate Submission from Website"
	  mail to: "kelli@hsdesignhouse.com"
	  # mail to: "cara@woofgangbakery.com"
	end
end
