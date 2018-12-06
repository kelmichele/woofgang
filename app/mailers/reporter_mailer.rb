class ReporterMailer < ApplicationMailer
	default from: "Media Inquiry Website Form <noreply@woofgangbakery.com>"
	default subject: "Media Inquiry from Website"

	def new_reporter(reporter)
	  @reporter = reporter

	  mail(to: "kelli@hsdesignhouse.com", subject: "Media Inquiry from Website") do |format|
  	  format.html
  	  format.text
    end
	  # mail to: "cara@woofgangbakery.com"
	end
end
