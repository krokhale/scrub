class ScriblesController < ApplicationController
  
  def show
    @scrible = Scrible.find(params[:id])
    @branches = @scrible.branches.count
    @comments = @scrible.comments.count
    @polls = @scrible.polls
    @similar = @scrible.find_related_tags
    @poll_options = @polls.collect(&:poll_options)
  end
  
end
