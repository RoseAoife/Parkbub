class ChargesController < ApplicationController
    def index
        redirect_to home_index_path
    end
    
    def new
        @post = params[:post]
        begin
            if Float(params[:hiddenPrice])
                @price = params[:hiddenPrice]
            end
        rescue
            redirect_back(fallback_location: home_index_path)
        end
    end

    def create        
      # Amount in cents
      @amount = 500

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
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
