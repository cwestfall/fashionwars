class VotesController < ApplicationController
  
  before_filter :authenticate_user!
  
  # POST /votes
  def create
    @vote = Vote.new(params[:vote])
    @vote.date = Date.today
    
    if current_user
      @vote.user = current_user
    else
      flash[:error] = 'You must be signed in to vote!'
      redirect_to authentications_url
    end
    
    if @vote.save
      redirect_to(root_path, :notice => 'Your vote was cast!  You can only vote once a day, come back tomorrow!')
    end
  end
end
