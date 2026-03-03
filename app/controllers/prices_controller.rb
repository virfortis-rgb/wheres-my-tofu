class PricesController < ApplicationController
  before_action :set_price, only: [:update, :destroy]

  def update
    if @price.update(price_params)
      redirect_to scan_path(params[:scan_id]), notice: "Updated!"
    else
      redirect_to scan_path(params[:scan_id]), alert: "Failed to update!"
    end
  end

  def destroy
  end

  private

  def set_price
    @price = Price.find(params[:id])
  end

  def price_params
    params.require(:price).permit(:price_with_tax, :price_without_tax, product_attributes: [:id, :name, :description])
  end
end
