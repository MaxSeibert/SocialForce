class ProfilesController < ApplicationController
before_action :set_profile, only: [:show, :edit, :update, :destroy]


  def index
    @profiles = Profile.all.order(:user_id)
  end

  def show
    #@profile = Profile.find_by_user_id(current_user.id)
    @profile = Profile.find_by(:user_id => current_user.id)
  end

  def new
    #@profile = Profile.new
    #@profile = current_user.profiles.build
    #@profile = Profile.find_by_user_id(current_user.id)
    @profile = current_user.profile.new
    
  end

  def edit
  end
  
  def show_user_profile
    @user_id = current_user.id
    #@profile = Profile.where(user_id: current_user[:id])
    @profiles = Profile.all
    @test = false
    
    if Profile.find(current_user.id) == nil
      @test = true
    end
    
    
    #if @profiles != nil
    render :userprofile
    #else
        #@profile = current_user.profile.new
      #render :new
    #end    
  end

  # POST /profiles
  def create

    #@profile = Profile.new(profile_params)
    #@profile.user = current_user
    #@profile = current_user.posts.build
    #@profile = Profile.find_by_user_id(current_user.id)
    @profile = current_user.profile.new(profile_params)
    
    
    if @profile.save
      
      @profileid = @profile.id
      #redirect_to @profile, notice: 'Profile was successfully created.'
      redirect_to findmatch_path(request.parameters.merge({:profileid => @profileid}))
      session[:return_to] ||= request.referer
      #redirect_to :controller => 'matches', :action => 'create'
    else
      render :new
    end
  end
  
  def destroy
    @profile.destroy
    redirect_to new_profile_url, notice: 'Profile was successfully destroyed.'
  end
  
  private
    def set_profile
      #@profile = current_user.profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through. 
    def profile_params
      params.require(:profile).permit(:name, :location, :impactfocus, :projecttype, :projectname, :milestones,:tfrom,:tto, :resources)
    end

end
