class BookingsController < ApplicationController

  before_action :set_parking_space
  # TODO  We'll need to authenticate the user for this controller too! (must be logged in)

  def index
    # TODO list the current parking space's bookings here
    # @bookings = @parking_space.bookings
  end

  def show
  end

  # GET /bookings/new
  def new
    # You can use fancy new associations!
    @booking = @parking_space.bookings.new
  end

  # GET /posts/1/edit
  def edit
  end
  # POST /posts
  # POST /posts.json
  def create
    # TODO move code that creates the booking here (similar to parking spaces controller)
    @booking = Booking.new(:price => @price, :parking_space_id => @parking_space_id, :user_id => current_user.id, :start_time => '123', :end_time => '312')
    @booking = @parking_spaces.bookings.new(booking_params)

    @booking.save

    redirect_to new_charge_path(booking: @booking)
    # after saving redirect to charges controller to make the charge. Example of how to link to a route with nested resources:
    # redirect_to parking_space_booking_path(@parking_space, @booking)
  end

  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking_space
      @parking_space = ParkingSpace.find(params[:parking_space_id])
    end

    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:parking_space).permit(:title, :body, :address, :cost)
    end
end
