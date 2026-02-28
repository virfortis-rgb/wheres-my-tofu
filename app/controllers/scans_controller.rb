class ScansController < ApplicationController
  def new
    @scan = Scan.new
    @stores = Store.all # confine to user's stores
  end

  def show
    @scan = Scan.find(params[:id])
    @prices = @scan.store.prices
  end

  def create
    @scan = Scan.new(scan_params)
    # @scan.flyer.attach(params[:scan][:flyer])
    # @scan.store = Store.find(params[:scan][:store])
    if @scan.save
      flash[:notice] = "Retrieving informtion from the flyer."
      AddFlyerDataToDbJob.perform_later(@scan)
      redirect_to @scan, notice: "Added products to the DB. Please double check!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def scan_params
    params.require(:scan).permit(:flyer, :store_id)
  end
end
