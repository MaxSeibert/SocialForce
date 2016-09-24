class OrganisationsController < ApplicationController
 before_action :set_organisation, only: [:show, :edit, :update, :destroy]

 
  def index
    @organisations = Organisation.all.order(:oname)
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
    redirect_to new_organisation_url, notice: 'Profile was successfully destroyed.'
  end
  
  def details
    @oid = params[:oid]
    #@orga_id = requestparams(:orga_id)
    @organisation = Organisation.find(@oid)
    render :show
  end
  
  def find_matching_organisation
    
    @orga_all = Organisation.all
    @profileid = params[:profileid]
    @profile_resource = params[:profile][:resources]
    @profile_impactfocus = params[:profile][:impactfocus]
    @profile_projecttype = params[:profile][:projecttype]
    if params[:profile][:tfrom] != nil && params[:profile][:tfrom] != ""
      @profile_tfrom = Date.parse(params[:profile][:tfrom])
    end
    if params[:profile][:tto] != nil && params[:profile][:tto] != ""
    @profile_tto = Date.parse(params[:profile][:tto])
    end
    @score = 0
    @oid = 1
    @oid_helper = 1
    
    
    @orga_all.each do |o|
      
      #@oamount_helper = o.amount
      #@oequipment_helper = o.equipment
      #@oimpactfocus_helper = o.impactfocus
      #@otfrom_helper = o.otfrom
      #@otto_helper = o.otto
      #@oname_helper = o.oname
      
      
      @score_helper = 0
      
      #set score for Matching-Process 
      #When resource Money is selected
      if @profile_resource == "Money" && o.oamount != nil
          if o.oamount >= 10000
            @score_helper +=10
          end
          if  9000 <= Integer(o.oamount)
            if Integer(o.oamount) < 10000
              @score_helper +=9
            end
          end
          if  8000 <= o.oamount.to_i 
            if o.oamount.to_i < 9000
              @score_helper +=8
            end
          end
          if  7000 <= o.oamount.to_i 
            if o.oamount.to_i < 8000
              @score_helper +=7
            end
          end
          if  6000 <= o.oamount.to_i 
            if o.oamount.to_i < 7000
              @score_helper +=6
            end
          end
          if  5000 <= o.oamount.to_i 
            if o.oamount.to_i < 6000
              @score_helper +=5
            end
          end
          if  4000 <= o.oamount.to_i 
            if o.oamount.to_i < 5000
              @score_helper +=4
            end
          end
          if  3000 <= o.oamount.to_i 
            if o.oamount.to_i < 4000
              @score_helper +=3
            end
          end
          if  2000 <= o.oamount.to_i 
            if o.oamount.to_i < 3000
              @score_helper +=2
            end
          end
          if  1000 <= o.oamount.to_i 
            if o.oamount.to_i < 2000
              @score_helper +=1
            end
          end
       else
         @score_helper += 0
       end   
       
       #resource equipment is selected
       if @profile_resource == "Equipment" && o.oequipment != nil
          if o.oequipment >= 100
            @score_helper +=10
          end
          if  90 <= o.oequipment
            if o.oequipment < 100
              @score_helper +=9
            end
          end
          if  80 <= o.oequipment 
            if o.oequipment < 90
              @score_helper +=8
            end
          end
          if  70 <= o.oequipment 
            if o.oequipment < 80
              @score_helper +=7
            end
          end
          if  60 <= o.oequipment 
            if o.oequipment < 70
              @score_helper +=6
            end
          end
          if  50 <= o.oequipment 
            if o.oequipment < 60
              @score_helper +=5
            end
          end
          if  40 <= o.oequipment 
            if o.oequipment < 50
              @score_helper +=4
            end
          end
          if  30 <= o.oequipment 
            if o.oequipment < 40
              @score_helper +=3
            end
          end
          if  20 <= o.oequipment 
            if o.oequipment < 30
              @score_helper +=2
            end
          end
          if  10 <= o.oequipment 
            if o.oequipment < 20
              @score_helper +=1
            end
          end
       else
         @score_helper += 0
       end
       
       #resource staff
       if @profile_resource == "Volunteers" && o.ostaff != nil
          if o.ostaff>= 100
            @score_helper +=10
          end
          if  90 <= o.ostaff
            if o.ostaff < 100
              @score_helper +=9
            end
          end
          if  80 <= o.ostaff 
            if o.ostaff < 90
              @score_helper +=8
            end
          end
          if  70 <= o.ostaff 
            if o.ostaff < 80
              @score_helper +=7
            end
          end
          if  60 <= o.ostaff 
            if o.ostaff < 70
              @score_helper +=6
            end
          end
          if  50 <= o.ostaff 
            if o.ostaff < 60
              @score_helper +=5
            end
          end
          if  40 <= o.ostaff 
            if o.ostaff < 50
              @score_helper +=4
            end
          end
          if  30 <= o.ostaff 
            if o.ostaff < 40
              @score_helper +=3
            end
          end
          if  20 <= o.ostaff 
            if o.ostaff < 30
              @score_helper +=2
            end
          end
          if  10 <= o.ostaff 
            if o.ostaff < 20
              @score_helper +=1
            end
          end
       else
         @score_helper += 0
       end
       
       #impacfocus selected
       if @profile_impactfocus == o.oimpactfocus
         @score_helper += 15        
       end
       
       #tfrom calculation
       if @profile_tfrom != nil
        if o.otfrom != nil
          if @profile_tfrom == o.otfrom
          @score_helper += 10
          end
              
          if @profile_tfrom < o.otfrom
          @score_helper += 0
          end
       
          if @profile_tfrom > o.otfrom
          @score_helper += 5
          end
        end
       end
       
       #tto calculation
       if @profile_tto != nil 
        if o.otto != nil
            if @profile_tto == o.otto
            @score_helper += 10
            end
       
            if @profile_tto < o.otto
            @score_helper += 5
            end
       
            if @profile_tto > o.otto
            @score_helper += 0
            end
        end
       end
       #projecttype calculation
       if @profile_projecttype == o.oprojecttype
         @score_helper += 10
       else
         @score_helper += 0
       end
       
       
       
       #set score
       if @score_helper > @score
          
         @oid = @oid_helper
         @score = @score_helper
         @oprojecttype = o.oprojecttype
         @oamount = o.oamount
         @oequipment = o.oequipment
         @oimpactfocus = o.oimpactfocus
         @otfrom = o.otfrom
         @otto = o.otto
         @oname = o.oname 
         @ostaff = o.ostaff 
         
         
       end     
          
       @oid_helper += 1     
    end
    
    #@organisationparams = [@oid, @oamount_helper, @oequipment_helper, @oimpactfocus_helper, @oname_helper, @otfrom_helper, @otto_helper]
    #@organisation = Organisation.find(@oid)
    
    #score in % 
    @score = @score*90/100
    
    redirect_to new_match_path(request.params.merge({:score => @score, :oid => @oid, :oname => @oname,:oprojecttype => @oprojecttype ,:oamount => @oamount, :oequipment => @oequipment, :ostaff => @ostaff, :oimpactfocus => @oimpactfocus, :otfrom => @otfrom, :otto => @otto, :ostaff => @ostaff, :profileid => @profileid})) 
    
    
   
    
    #@orga_amount = Organisation.find(@orga_id).oamount
    
    #@organisation = Organisation.find(@oid)
    #render :show
    
    
  end  
    
  
  
  #call this method after profilecreation
  def get_organisation_params_for_match
    #get the params important for match and fetch them to request. navigate to match new/show
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

