class StocksController < ApplicationController
  
  def search
    if params[:symbol].present?
      @symbol = Stock.new_lookup(params[:symbol])
      if @symbol
        render 'users/my_portfolio'
      else
        flash[:alert] = 'Please enter a valid symbol'
        redirect_to my_portfolio_path
      end
    else
      flash[:alert] = 'Please enter a symbol'
      redirect_to my_portfolio_path
    end
  end

end