class PricesController < ApplicationController

  def update
    @price = Price.find(params[:id])
    if @price.update(price_params)
      redirect_to scan_path(params[:scan_id]), notice: "Updated!"
    else
      redirect_to scan_path(params[:scan_id]), alert: "Failed to update!"
    end
  end

  def destroy
  end

  private

  def price_params
    params.require(:price).permit(:price_with_tax, :price_without_tax, :scan_id, product_attributes: [:id, :name, :description])
  end
end
