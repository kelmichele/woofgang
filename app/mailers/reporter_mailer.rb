class ReporterMailer < ApplicationMailer
	default from: "Media Inquiry Website Form <noreply@woofgangbakery.com>"
	default subject: "Media Inquiry"

	def new_reporter(reporter)
	  @reporter = reporter

	  
	  mail(to: "kelli@hsdesignhouse.com", subject: "Media Inquiry") do |format|
	  # mail(to: "cara@woofgangbakery.com", subject: "Media Inquiry") do |format|
  	  format.html
  	  format.text
    end
	end
end
