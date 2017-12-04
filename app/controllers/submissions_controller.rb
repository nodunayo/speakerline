class SubmissionsController < ApplicationController
  def new
    @proposal = Proposal.find(params[:proposal])
    @submission = Submission.new(proposal_id: @proposal.id)
    @events = Event.all.order('name ASC, year ASC')
  end

  def create
    @submission = Submission.new(submission_params)
    if verify_recaptcha(model: @submission) && @submission.save
      redirect_to proposal_path(@submission.proposal)
    else
      flash[:alert] = 'Failed to save submission'
      redirect_to new_submission_path(proposal: @submission.proposal.id)
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:event_id, :proposal_id, :result).to_h
  end
end
