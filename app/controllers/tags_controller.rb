class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.order(name: :asc)
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find_by(name: params[:id])

    if @tag.present?
      @proposals = Proposal.tagged_with(@tag.name)
    else
      notice =
        "We don't currently have a tag for \"#{params[:id]}\" - but
        you can <a href='#{new_proposal_path}'>create a proposal and add it as a new tag.</a>"

      redirect_to tags_path, notice: notice
    end
  end
end
