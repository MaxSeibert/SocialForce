class MatchesController < ApplicationController
  def index
  end

  def new
    @match = Matches.new
  end

  def show
  end
  
  def create
    @match = current_profile.Matches.new(match_params)
    
    if @match.save
      redirect_to @match, notice: 'Match was successfull'
    else
      #redirect_to url_for(:controller => :profile, :action => :show)
      redirect_to session.delete(:return_to)
    end
  end
  
  def details
    redirect_to @organisation.find(1)
  end
  
  private
  def match_params
      params.require(:match).permit(:name, :location, :score, :projecttype, :milestones, :tfrom, :tto, :amount, :equipment, :staff)
  end
  
  def get_organisation_params
    #@match.name = @organisation.find(1).name
    #@match.amount = @organisation.find(1).amount
    #@match.equipment = @organisation.find(1).equipment
    #@match.staff = @organisation.find(1).staff
  end
  
  
end
