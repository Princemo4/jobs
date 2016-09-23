class SubmitalsController < ApplicationController
  before_action :authenticate_user!

  def create
      @posting = Posting.find(params[:posting_id])

      if @submital = @posting.submitals.find_by(user_id: current_user.id)
        flash[:notice] = "You've already submitted to this job on #{@submital.created_at.strftime "%D"}, User: #{current_user.name}"
        redirect_to @posting
      else
        @submital = @posting.submitals.new(submital_params)
        @submital.user_id = current_user.id if current_user
        if @submital.save
          flash[:notice] = "Resume Submitted Successfully"
          redirect_to @submital.posting
        else
          flash[:notice] = "Error submitting resume"
          redirect_to @submital.posting
        end
      end

  end

  private

  def submital_params
    params.required(:submital).permit(:posting_id)
  end

end
