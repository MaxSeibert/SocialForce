class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :edit, :update, :destroy]

  # GET /gifts
  def index
    @gifts = Gift.all
  end

  # GET /gifts/1
  def show
  end

  # GET /gifts/new
  def new
    if current_user.role=="Admin" || current_user.role=="Employee" || current_user.role=="Sozail_Organisation"
      @gift = Gift.new
      @oid = params[:oid]
    else
      render :index
    end
  end

  # GET /gifts/1/edit
  def edit
     #@gift.image.cache!
     #@gift.save 
     #@gift.image = params[:image]
  end

  # POST /gifts
  def create
    @gift = Gift.new(gift_params)
    @gift.oid = params[:oid]
    #@gift.image = File.open()
    #if @gift.image.file.nil?
    @gift.image = params[:image]   
    #end
    if @gift.save
    #if @gift.image.file.nil?
      redirect_to @gift, notice: 'Gift was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /gifts/1
  def update

    #@gift.update_attribute(:image, params[:image])
    #@gift.image = params[:image]
    
    #if @gift.update_all
    #@gift.update_attributes({:image => params[:image]}) 
    #@gift.image = params[:image]
    #@gift.update_attribute(:image, "params[:image]")
    
    #if @gift.update(update_all)
    
    #some validation shit wont let me update
    if @gift.update(gift_params)
      
      #@gift.remove_image = true 
      #@gift.image = params[:image]
      
      redirect_to @gift, notice: 'Gift was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /gifts/1
  def destroy
    @gift.destroy
    
    #remove image directory
    Dir.rmdir("public/uploads/gift/image/#{@gift.id}")
    
    redirect_to gifts_url, notice: 'Gift was successfully destroyed.'
  end


  def showorga
    #@gifts = Gift.where(oid: params[:oid])
    #@gifts = Gift.all
    @oid = params[:oid]
    @gifts = Gift.where("oid = ?", params[:oid])
    if @gifts != nil
      render :showorga
    else
      render :new
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift
      @gift = Gift.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def gift_params
      #params.fetch(:gift, {:name,:heading})
      params.require(:gift).permit(:giftname, :heading, :image, :oid)
    end
end
