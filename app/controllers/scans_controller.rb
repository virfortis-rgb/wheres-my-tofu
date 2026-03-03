class ScansController < ApplicationController
  before_action :set_scan, only: [:show, :destroy]

  def new
    @scan = Scan.new
    @stores = Store.all # confine to user's stores
    @scans = Scan.all.order(created_at: :desc)
  end

  def show
    @prices = @scan.store.prices
  end

  def create
    @scan = Scan.new(scan_params)
    if @scan.save
      flash[:notice] = "Retrieving informtion from the flyer."
      AddFlyerDataToDbJob.perform_later(@scan)
      redirect_to @scan, notice: "Added products to the DB. Please double check!"
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
