class MatchesController < ApplicationController
  def index
  end

  def new
  end

  def show
  end
  
  def create
    @match = current_user.match.new(match_params)
    
    if @match.save
      redirect_to @match, notice: 'Match was successfull'
    else
      #redirect_to url_for(:controller => :profile, :action => :show)
      redirect_to session.delete(:return_to)
    end
  end
  
  
  private
  def match_params
      params.require(:match).permit(:name, :location, :score, :image, :projecttype, :milestones, :tfrom, :tto, :amount, :equipment, :staff)
  end
  
end
