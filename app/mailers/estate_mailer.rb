class EstateMailer < ApplicationMailer
	default from: "Real Estate Submission Website Form <noreply@woofgangbakery.com>"
	default subject: "Real Estate Submission"

	def new_estate(estate)
	  @estate = estate

	  # rwesner@woofgangbakery.com
	  mail(to: "kelli@hsdesignhouse.com", subject: "Real Estate Submission") do |format|
  	  format.html
  	  format.text
    end
	end
end
