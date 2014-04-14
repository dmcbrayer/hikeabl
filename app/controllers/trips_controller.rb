class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  #before_action :correct_user, except: [:edit, :update, :destroy]


  def index
    @trips = Trip.all
  end

  def show
  end

  def new
    @trip = current_user.trips.build
  end

  def edit
  end

  def create
    @trip = current_user.trips.build(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to @trip, notice: 'Trip was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trip }
      else
        format.html { render action: 'new' }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
        format.json { render action: 'show', status: :ok, location: @trip }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trip.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    def correct_user
      @trip = current_user.trips.find_by(id: params[:id])
      redirect_to trips_path, notice: "Not authorized" if @trip.nil?
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      params.require(:trip).permit(:starts_on, :ends_on, :name, :location)
    end
end
