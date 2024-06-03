class ProposalsController < ApplicationController
  include ApplicationHelper

  before_action :require_user!, only: [:new, :create, :edit, :update]
  before_action :set_proposal, only: [:edit, :update]

  def index
    @proposals = Proposal.order('title ASC')
    if params[:search].present?
      @proposals = @proposals.search(params[:search])
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)

    if @proposal.save
      flash[:notice] = 'Proposal created successfully!'

      redirect_to proposal_path(@proposal)
    else
      render 'new'
    end
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def update
    @proposal = Proposal.find(params[:id])
    if @proposal.update(proposal_params)
      flash[:notice] = 'Proposal updated successfully!'

      redirect_to proposal_path(@proposal)
    else
      render 'edit'
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :body, :tag_list).
      merge(speaker_id: current_user.speaker.id).to_h
  end

  def set_proposal
    @proposal = current_user.proposals.where(id: params[:id]).first
    redirect_to proposals_path if @proposal.blank?
  end
end
