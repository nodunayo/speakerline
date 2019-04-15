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
    @proposal = Proposal.find(params[:id])
    @speakers = speakers
  end

  def update
    @proposal = Proposal.find(params[:id])
    if verify_recaptcha(model: @proposal) && @proposal.update_attributes(proposal_params)
      redirect_to proposal_path(@proposal)
    else
      @speakers = speakers
      render 'edit'
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
