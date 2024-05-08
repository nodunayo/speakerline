class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.order(name: :asc)
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find_by(name: params[:id])
    @proposals = Proposal.tagged_with(@tag.name)
  end
end
