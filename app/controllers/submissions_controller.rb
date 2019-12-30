class SubmissionsController < ApplicationController
  def new
    @proposal = Proposal.find(params[:proposal])
    @submission = Submission.new(proposal_id: @proposal.id)
    @events = Event.all.order('name ASC')
  end

  def create
    @submission = Submission.new(submission_params)
    if verify_recaptcha(model: @submission) && @submission.save
      redirect_to proposal_path(@submission.proposal)
    else
      @proposal = @submission.proposal
      @events = Event.all.order('name ASC')
      render 'new'
    end
  end

  def edit
    @submission = Submission.find(params[:id])
    @proposal = @submission.proposal
  end

  def update
    @submission = Submission.find(params[:id])
    @proposal = @submission.proposal
    if verify_recaptcha(model: @submission) && @submission.update(submission_params)
      redirect_to proposal_path(@proposal)
    else
      flash[:alert] = 'Failed to update submission'
      render 'edit'
    end
  end

  private

  def submission_params
    params.require(:submission).permit(:event_instance_id, :proposal_id, :result).to_h
  end
end
