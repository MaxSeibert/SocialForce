class ProgramsController < ApplicationController
 before_action :set_program, only: [:show, :edit, :update, :destroy]

 
  def index
    @programs = Program.all
  end
  
  def new
    if current_user.role=="Admin" || current_user.role=="Employee" || current_user.role=="Sozail_Organisation"
      @program = Program.new
      @oid = params[:oid]
    else
      render :index
    end
  end
  
  def edit
    
  end
  
  def create
    @program = Program.new(program_params)
    @program.oid = params[:oid]
     if @program.save
      redirect_to @program, notice: 'Program was successfully created.'
    else
      render :new
    end
    
  end
  
  def update
    if @program.update(program_params)
      redirect_to @program, notice: 'Program was successfully updated.'
    else
      render :edit
    end
  end
  
  
  def destroy
    @program.destroy
    
    redirect_to programs_url, notice: 'Program was successfully destroyed.'
  end
  
 private
  def set_program
      @program = Program.find(params[:id])
  end
  
    
  def program_params
      params.require(:program).permit(:name, :description, :heading, :oid)
    
  end
  
  
  
end
