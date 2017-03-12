class ProposalsController < ApplicationController
  include ApplicationHelper

  def show
    @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.create!(proposal_params)
    redirect_to proposal_path(@proposal)
  rescue ActiveRecord::ActiveRecordError
    flash[:alert] = 'Failed to save proposal'
    redirect_to new_proposal_path
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def update
    @proposal = Proposal.find(params[:id])
    @proposal.update_attributes(proposal_params)
    redirect_to @proposal
  rescue ActiveRecord::ActiveRecordError
    flash[:alert] = 'Failed to update proposal'
    render 'edit'
  end
  
  private

  def proposal_params
    params.require(:proposal).permit(:title, :body, :speaker_id).to_h
  end
end
