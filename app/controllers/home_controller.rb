class HomeController < ApplicationController
  def index
    @current_entries = ContestantEntry.where("date = ?", Date.today).sort_by { |ce| ce.contestant.score }
    if @current_entries.empty?
      flash[:notice] = 'The contestant photos have not been uploaded for the day, check back later.'
    end
    
    @vote = Vote.new
  
    @contestants = Contestant.all.sort_by { |c| - c.score }
    if current_user && current_user.voted_today?
     flash[:notice] = 'You have already voted today, come back tomorrow!'
    end 
  end

end
