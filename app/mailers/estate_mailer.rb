class EstateMailer < ApplicationMailer
	default from: "Real Estate Submission Website Form <noreply@woofgangbakery.com>"
	default subject: "Real Estate Submission"

	def new_estate(estate)
	  @estate = estate

	  #kelli@hsdesignhouse.com
	  mail(to: "rwesner@woofgangbakery.com", subject: "Real Estate Submission") do |format|
  	  format.html
  	  format.text
    end
	end
end
