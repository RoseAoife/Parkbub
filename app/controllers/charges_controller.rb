class ChargesController < ApplicationController
    def index
        redirect_to home_index_path
    end

    def new
        puts params
        @parking_space_id = params[:parking_space_id]
        @price = params[:price]
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
