class ProposalsController < ApplicationController
  include ApplicationHelper

  def index
    @proposals = Proposal.order('title ASC')
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal = Proposal.new
    @speakers = speakers
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if verify_recaptcha(model: @proposal) && @proposal.save
      redirect_to proposal_path(@proposal)
    else
      @speakers = speakers
      render 'new'
    end
  end

  def edit
    if session[:current_user_id]
      @proposal = Proposal.find(params[:id])
      @speakers = speakers
    else
      redirect_to "#{ENV["DID_AUTHENTICATION_ENDPOINT"]}?client_id=#{ENV["DID_CLIENT_ID"] || "test_0xKvM6N9"}&redirect_uri=#{session_callback_url}"
    end
  end

  def update
    if session[:current_user_id]
      @proposal = Proposal.find(params[:id])
      if verify_recaptcha(model: @proposal) && @proposal.update(proposal_params)
        redirect_to proposal_path(@proposal)
      else
        @speakers = speakers
        render 'edit'
      end
    else
      redirect_to "#{ENV["DID_AUTHENTICATION_ENDPOINT"]}?client_id=#{ENV["DID_CLIENT_ID"] || "test_0xKvM6N9"}&redirect_uri=#{session_callback_url}"
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :body, :tag_list, :speaker_id).to_h
  end

  def speakers
    Speaker.all.order('name ASC')
  end
end
