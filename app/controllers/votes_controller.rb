class VotesController < ApplicationController
  before_filter :authenticate_user!
  
  def create
    @current_user = current_user
    voteable_name = (params[:vote][:voteable_type]).constantize
    @voteable = voteable_name.find(params[:vote][:voteable])
    vote = params[:vote][:vote]
    if vote == "false"
      @current_user.vote_against(@voteable)
    else
      @current_user.vote_for(@voteable)
    end
    respond_to do |format|
      format.js
    end
  end


end
