class SubmitalsController < ApplicationController

  def create
      @posting = Posting.find(params[:posting_id])

      unless @posting.submitals.where(user_id: current_user)
        @submital = @posting.submitals.new(submital_params)
        @submital.user_id = current_user.id if current_user

        if @submital.save
          flash[:notice] = "Resume Submitted Successfully"
          redirect_to @submital.posting
        else
          flash[:notice] = "Error submitting resume"
          redirect_to @submital.posting
        end

      else
        flash[:notice] = "You've already submitted to this job"
        redirect_to @posting

      end

  end

  private

  def submital_params
    params.required(:submital).permit(:posting_id)
  end

end
