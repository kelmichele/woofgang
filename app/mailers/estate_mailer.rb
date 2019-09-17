class EstateMailer < ApplicationMailer
	default from: "Real Estate Submission Website Form <noreply@woofgangbakery.com>"
	default subject: "Real Estate Submission"

	def new_estate(estate)
	  @estate = estate

	  
	  # mail(to: "cara@clocktowerrealty.net,josh@woofgangbakery.com", subject: "Real Estate Submission") do |format|
	  mail(to: "kelli@hsdesignhouse.com", subject: "Real Estate Submission") do |format|
  	  format.html
  	  format.text
    end
	end
end
