class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update, :destroy]

 #map from user profile to volunteer?
  def index
    @volunteers = Volunteer.all
  end
  
  def new
    #when user can be selected as volunteer uncomment if statement
    #if is_volunteer == true
      @volunteer = Volunteer.new
      @volunteer.name = current_user.first_name
      #@organisation = Organisation.all.order(:id)
      #@uid = current_user.id
    #else
    #  render :index
    #end
  end
 
  
  def show
  end
  
  def create
    @volunteer = Volunteer.new(volunteer_params)
    @volunteer.name = current_user.first_name
    #@volunteer.uid = current_user.id
     if @volunteer.save
      redirect_to @volunteer, notice: 'Volunteer was successfully created.'
    else
      render :new
    end
    
  end
  
  def update
    
    if @volunteer.update(volunteer_params)
      redirect_to @volunteer, notice: 'Volunteer was successfully updated.'
    else
      render :edit
    end
  
  end
  
  def destroy
    @volunteer.destroy
    
    redirect_to volunteers_url, notice: 'Volunteer was successfully destroyed.'
  end
 
 private
  def set_volunteer
      @volunteer = Volunteer.find(params[:id])
  end
  
    
  def volunteer_params
      params.require(:volunteer).permit(:name, :time, :date, :oid)
    
  end
  
end
