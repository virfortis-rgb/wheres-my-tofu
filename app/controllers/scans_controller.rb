class ScansController < ApplicationController
  include ActiveStorage::SetCurrent
  before_action :set_scan, only: [:show, :destroy]

  def new
    @scan = Scan.new
    @stores = Store.all # confine to user's stores
    @scans = Scan.all.order(created_at: :desc)
  end

  def show
  scan_prices = @scan.scan_prices
  @prices = scan_prices.map  { |scan_price| scan_price.price }
  end

  def create
    @scan = Scan.new(scan_params)
    if @scan.save
      flash[:notice] = "Retrieving informtion from the flyer."
      AddFlyerDataToDbJob.perform_later(@scan)
      redirect_to @scan, notice: "Adding products to the DB. This could take a moment!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @scan.destroy
    redirect_to new_scan_path, notice: 'Flyer was successfully deleted.'
  end

  private

  def set_scan
    @scan = Scan.find(params[:id])
  end

  def scan_params
    params.require(:scan).permit(:flyer, :store_id)
  end
end
