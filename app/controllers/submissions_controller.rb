class SubmissionsController < ApplicationController
  def new
    if session[:current_user_id]
      @proposal = Proposal.find(params[:proposal])
      @submission = Submission.new(proposal_id: @proposal.id)
      @events = Event.all.order('name ASC')
    else
      redirect_to "#{ENV["DID_AUTHENTICATION_ENDPOINT"]}?client_id=#{ENV["DID_CLIENT_ID"] || "test_0xKvM6N9"}&redirect_uri=#{session_callback_url}"
    end
  end

  def create
    return if !session[:current_user_id]

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
    if session[:current_user_id]
      @submission = Submission.find(params[:id])
      @proposal = @submission.proposal
    else
      redirect_to "#{ENV["DID_AUTHENTICATION_ENDPOINT"]}?client_id=#{ENV["DID_CLIENT_ID"] || "test_0xKvM6N9"}&redirect_uri=#{session_callback_url}"
    end
  end

  def update
    if !session[:current_user_id]
      redirect_to "#{ENV["DID_AUTHENTICATION_ENDPOINT"]}?client_id=#{ENV["DID_CLIENT_ID"] || "test_0xKvM6N9"}&redirect_uri=#{session_callback_url}"
      return
    end

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
