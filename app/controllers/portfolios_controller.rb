class PortfoliosController < ApplicationController
  before_action :find_portfolio, only: [:show, :edit, :update, :destroy]

  def new
    @portfolio = Portfolio.new
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)
    @portfolio.user = current_user
     if @portfolio.save
      redirect_to portfolio_path(@portfolio)
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @portfolio.destroy
    redirect_to user_path(current_user)
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:name)
  end

  def find_portfolio
    @portfolio = Portfolio.find(params[:id])
  end

end
