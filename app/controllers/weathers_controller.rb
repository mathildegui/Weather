class WeathersController < ApplicationController
  before_action :set_weather, only: [:show, :update, :destroy]

  # GET /weathers
  # GET /weathers.json
  def index
    @weathers = Weather.all
    render json: @weathers
  end

  # GET /weathers/1
  # GET /weathers/1.json
  def show
    render json: @weather
  end

  # GET /weathers/new
  #def new
  #  @weather = Weather.new
  #end

  # GET /weathers/1/edit
  #def edit
  #end

  # POST /weathers
  # POST /weathers.json
  def create
    @weather = Weather.new(weather_params)

    #respond_to do |format|
      if @weather.save
        render json: @weather, status: :created, location: @weather
        #format.html { redirect_to @weather, notice: 'Weather was successfully created.' }
        #format.json { render :show, status: :created, location: @weather }
      else
        render json: @weather.errors, status: :unprocessable_entity
        #format.html { render :new }
        #format.json { render json: @weather.errors, status: :unprocessable_entity }
      end
    #end
  end

  # PATCH/PUT /weathers/1
  # PATCH/PUT /weathers/1.json
  def update
    #respond_to do |format|
      if @weather.update(weather_params)
        render json: @weather
        #format.html { redirect_to @weather, notice: 'Weather was successfully updated.' }
        #format.json { render :show, status: :ok, location: @weather }
      else
        render json: @weather.errors, status: unprocessable_entity
        #format.html { render :edit }
        #format.json { render json: @weather.errors, status: :unprocessable_entity }
      end
    #end
  end

  # DELETE /weathers/1
  # DELETE /weathers/1.json
  def destroy
    @weather.destroy
    #respond_to do |format|
    #  format.html { redirect_to weathers_url, notice: 'Weather was successfully destroyed.' }
    #  format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weather
      @weather = Weather.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def weather_params
      params.require(:weather).permit(:temperature, :humidity)
    end
end
