class TagsController < ApplicationController
  def show
    @tag =  ActsAsTaggableOn::Tag.find_by(name: params[:id])
    @proposals = Proposal.tagged_with(@tag.name)
  end
end
