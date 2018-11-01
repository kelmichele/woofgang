class CandidatesController < ApplicationController
	def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.valid? && @candidate.save
      CandidateMailer.new_candidate(@candidate).deliver unless candidate_params[:honey].present?
      redirect_to franchise_inquiries_path, notice: "Your franchise inquiry has been sent. We appreciate your interest."
    else
      # flash[:alert] = "An error occurred while delivering this message. All fields are required."
      render :new
    end
  end

  private
    def candidate_params
      params.require(:candidate).permit(:name, :email, :phone, :address, :city, :state, :zip, :experience, :background, :preferred_state, :preferred_city, :cash, :terms, :time_frame, :honey)
    end
end
