class SozialOrganisationsController < ApplicationController
  def index
    @sozialOrganisations = SozialOrganisations.all
  end

  def show
    
  end

  def new
    @sozialOrganisation = current_user.sozialOrganisation.new
  end

  def create
    @sozialOrganisation = current_user.sozialOrganisation.new(sozialOrganisation_params)
    
    if @sozialOrganisation.save
      redirect_to @sozialOrganisation, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end
end

 def destroy
    @sozialOrganisation.destroy
    redirect_to sozialOrganisations_url, notice: 'Profile was successfully destroyed.'
  end
  
  private
    def set_sozialOrganisation
      #@profile = current_user.profile
      @profile = SozialOrganisation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through. 
    def profile_params
      params.require(:sozialOrganisation).permit(:name, :location, :impactfocus, :projecttype, :projectname, :milestones, :tfrom, :tto, :resources)
    end
