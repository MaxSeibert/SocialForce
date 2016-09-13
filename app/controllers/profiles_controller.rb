class ProfilesController < ApplicationController
before_action :set_profile, only: [:show, :edit, :update, :destroy]


  def index
    @profiles = Profile.all
  end

  def show
  end

  def new
    @profile = Profile.new
  end

  def edit
  end

  # POST /users
  def create
    @profile = Profile.new(profile_params)
  end
  
  def destoy
  end
  
  private
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through. 
    def profile_params
      params.require(:profile).permit(:name, :location, :impactfocus)
    end

end
