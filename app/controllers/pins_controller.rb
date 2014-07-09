class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  


  def index
    @pins = Pin.all
  end


  def show
  end

  def new
    @pin = current_user.pins.build
  end


  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
      if @pin.save
        redirect_to @pin, notice: 'Pin was successfully created.' 
      else
        render action: 'new' 
    end
  end

  
  def update
      if @pin.update(pin_params)
        redirect_to @pin, notice: 'Pin was successfully updated.' 
      else
        render action: 'edit' 
    end
  end

 
 def destroy
    @pin.destroy
    redirect_to pins_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id]) # this means: it tries to look up the pin through the user, and if the pin does not belong to the user, then “@pin” will be nil.
      redirect_to pins_path, notice: 'Not authorized to edit this pin' if @pin.nil? #this says if pin is nil, redirect to the pins_path, with the notice: “Not authorized to edit this pin”
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description)
    end
end
