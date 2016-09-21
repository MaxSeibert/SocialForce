class OrganisationsController < ApplicationController
 before_action :set_organisation, only: [:show, :edit, :update, :destroy]

 
  def index
    @organisations = Organisation.all
  end

  def new
    @organisation = Organisation.new
  end

  def show
  end
  
  def edit
    @organisation = Organisation.find(params[:id])
  end
  
  def create
    @organisation = Organisation.new(organisation_params)
  
    if @organisation.save
      redirect_to @organisation, notice: 'Profile was successfully created.'
      session[:return_to] ||= request.referer
      #redirect_to :controller => 'matches', :action => 'create'
    else
      render :new
    end
  
  end
  
  def destroy
    @organisation.destroy
    redirect_to organisations_url, notice: 'Profile was successfully destroyed.'
  end
  
  def details
    @organisation = Organisation.find(1)
  end
  
  private
    def set_organisation
      #@profile = current_user.profile
      @organisation = Organisation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through. 
    def organisation_params
      params.require(:organisation).permit(:oname, :olocation, :oimpactfocus, :oprojecttype, :oprojectname, :omilestones,:otfrom, :otto, :oamount, :oequipment, :ostaff)
    end
  
  
  
end
