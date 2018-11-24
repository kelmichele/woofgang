class ReportersController < ApplicationController
	def new
    @reporter = Reporter.new
  end

  def create
    @reporter = Reporter.new(reporter_params)

    if @reporter.valid? && @reporter.save
      ReporterMailer.new_reporter(@reporter).deliver unless reporter_params[:honey].present?
      redirect_to media_inquiries_path, notice: "Your form has been sent. Thank you for reaching out."
    else
      render :new
    end
  end

  private
    def reporter_params
      params.require(:reporter).permit(:first_name, :last_name, :email, :phone, :outlet, :question, :honey)
    end
end
