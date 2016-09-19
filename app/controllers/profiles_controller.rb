class ProfilesController < ApplicationController
before_action :set_profile, only: [:show, :edit, :update, :destroy]


  def index
    @profiles = Profile.all
  end

  def show
    #@profile = Profile.find_by_user_id(current_user.id)
  end

  def new
    #@profile = Profile.new
    #@profile = current_user.profiles.build
    #@profile = Profile.find_by_user_id(current_user.id)
    @profile = current_user.profile.new
    
  end

  def edit
  end

  # POST /profiles
  def create

    #@profile = Profile.new(profile_params)
    #@profile.user = current_user
    #@profile = current_user.posts.build
    #@profile = Profile.find_by_user_id(current_user.id)
    @profile = current_user.profile.new(profile_params)
    
    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new
    end
  end
  
  def destroy
    @profile.destroy
    redirect_to profiles_url, notice: 'Profile was successfully destroyed.'
  end
  
  private
    def set_profile
      #@profile = current_user.profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through. 
    def profile_params
      params.require(:profile).permit(:name, :location, :impactfocus, :projecttype, :projectname, :milestones, :tfrom, :tto, :resources)
    end

end
