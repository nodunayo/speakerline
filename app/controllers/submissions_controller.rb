class SubmissionsController < ApplicationController
  def new
    @proposal = Proposal.find(params[:proposal])
    @submission = Submission.new(proposal_id: @proposal.id)
    @events = Event.all.order('name ASC, year ASC')
  end

  def create
    @submission = Submission.create!(submission_params)
    redirect_to proposal_path(@submission.proposal)
  rescue ActiveRecord::ActiveRecordError
    flash[:alert] = 'Failed to save submission'
    redirect_to new_submission_path
  end

  private

  def submission_params
    params.require(:submission).permit(:event_id, :proposal_id, :result).to_h
  end
end
