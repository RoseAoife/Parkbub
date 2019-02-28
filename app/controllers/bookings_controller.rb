class BookingsController < ApplicationController
  before_action :authenticated_user!
  before_action :set_parking_space

  def index
    @bookings = Booking.where(:parking_space_id => params[:parking_space_id])
  end

  # GET /bookings/new
  def new
    @booking = @parking_space.bookings.new
  end

  # GET /posts/1/edit
  def edit
  end
  # POST /posts
  # POST /posts.json
  def create  
    @start_time = DateTime.parse(params["booking"]["start_time(1i)"].to_s + '-' + params["booking"]["start_time(2i)"].to_s + '-' + params["booking"]["start_time(3i)"].to_s + ' ' + params["booking"]["start_time(4i)"].to_s + ':' + params["booking"]["start_time(5i)"].to_s + ':' + '0')
      
    @end_time = DateTime.parse(params["booking"]["end_time(1i)"].to_s + '-' + params["booking"]["end_time(2i)"].to_s + '-' + params["booking"]["end_time(3i)"].to_s + ' ' + params["booking"]["end_time(4i)"].to_s + ':' + params["booking"]["end_time(5i)"].to_s + ':' + '0')
        
    @booking = Booking.new(:price => 100.00, :parking_space_id => params[:parking_space_id], :user_id => current_user.id, :start_time => @start_time, :end_time => @end_time)
    @booking = ParkingSpace.find(params[:parking_space_id]).bookings.new(booking_params)
      
    puts '!!!!!!!!!!!!!!!!!!!!!!!!!!!'
    puts @booking.attributes
    puts current_user.id
    puts params[:hiddenPrice]
    #ID: NIL
    #PRICE: NIL
    #USER_ID: NIL
    #CREATED/UPDATED: NIL
      
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
      params.require(:booking).permit(:start_time, :end_time, :price, :parking_space_id, :user_id)
    end
end
