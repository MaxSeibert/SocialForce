class MatchesController < ApplicationController
  before_action :set_match, only: [ :details, :show] 
  
  def index
    @match = Matches.all
  end

  def new
    @name = params[:oname]
    @score = params[:score]
    @projecttype = params[:oprojecttype]
    @tfrom = params[:otfrom]
    @tto = params[:otto]
    @amount = params[:oamount]
    @staff = params[:ostaff]
    @equipment = params[:oequipment]
    @oid = params[:oid]
    @user_id = current_user.id
    @profileid = params[:profileid]    
    
  end

  def show
    @match = Matches.find(params[:id])
    #@mname = params[:name]
    #@mscore = params[:score]
    #@projecttype = params[:projecttype]
    #@mtfrom = params[:tfrom]
    #@mtto = params[:tto]
    #@mamount = params[:amount]
    ##@staff = params[:staff]
    #@mequipment = params[:equipment]
    #@oid = params[:oid]
    #@match = Matches.find(params[:id])
  end
  
  def show_user_matches
    @user_id = current_user.id
    @match = Matches.all
    render :usermatches
  end
  
  def create
    
    #request.params. except(:utf8, :authenticity_token, :commit)
    @match = Matches.new(match_params)
    
    if @match.save
      redirect_to @match, notice: 'Match was successfull'
    else
      #redirect_to url_for(:controller => :profile, :action => :show)
      redirect_to session.delete(:return_to)
    end
  end
  
 
  
  private
  def match_params
      params.permit(:name, :location, :score, :projecttype, :milestones, :tfrom, :tto, :amount, :equipment, :staff, :user_id, :profileid)
  end
  
  def get_organisation_params
    #@match.name = @organisation.find(1).name
    #@match.amount = @organisation.find(1).amount
    #@match.equipment = @organisation.find(1).equipment
    #@match.staff = @organisation.find(1).staff
  end
  
  def set_match
      @match = Matches.find(params[:id])
  end  
  
end
