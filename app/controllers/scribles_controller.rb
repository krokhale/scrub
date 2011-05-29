class ScriblesController < ApplicationController
  
  def show
    @scrible = Scrible.find(params[:id])
    @branches = @scrible.branches.count
    @comments = @scrible.comments.count
    @polls = @scrible.polls
  end
  
end
