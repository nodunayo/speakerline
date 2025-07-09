class ProposalsController < ApplicationController
  include ApplicationHelper

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
    @speakers = speakers
    preselected_speaker = @speakers.where(id: params[:speaker_id]).first
    @proposal = Proposal.new(speaker_id: preselected_speaker&.id)
  end

  def create
    @proposal = Proposal.new(proposal_params)
    if verify_recaptcha(model: @proposal) && @proposal.save
      flash[:notice] = 'Proposal created successfully!'

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
    if verify_recaptcha(model: @proposal) && @proposal.update(proposal_params)
      flash[:notice] = 'Proposal updated successfully!'

      redirect_to proposal_path(@proposal)
    else
      @speakers = speakers
      render 'edit'
    end
  end

  private

  def proposal_params
    params.require(:proposal).permit(:title, :body, :tag_list, speaker_ids: []).to_h
  end

  def speakers
    Speaker.all.order(name: :asc)
  end
end
