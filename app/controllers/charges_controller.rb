class ChargesController < ApplicationController
    def index
        redirect_to home_index_path
    end
    
    def new        
        @parking_space_id = params[:parking_space_id]
        
        begin
            if Float(params[:hiddenPrice])
                @price = params[:hiddenPrice]
            end
        rescue
            redirect_back(fallback_location: home_index_path)
        end
        
        @booking = Booking.new(:price => @price, :parking_space_id => @parking_space_id, :user_id => current_user.id, :start_time => '123', :end_time => '312')
        @booking.save
    end

    def create 
      @amount = params[:hiddenPrice]
      @amount2 = params[:hiddenPrice2]
      @booking = params[:booking]
        
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken],
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to new_charge_path
      end
end
