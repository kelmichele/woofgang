class ReporterMailer < ApplicationMailer
	default from: "Media Inquiry Website Form <noreply@woofgangbakery.com>"
	default subject: "Media Inquiry from Website"

	def new_reporter(reporter)
	  @reporter = reporter

	  mail subject: "Media Inquiry from Website"
	  mail to: "kelli@hsdesignhouse.com"
	end
end
