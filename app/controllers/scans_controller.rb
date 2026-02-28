class ScansController < ApplicationController
  def new
    @scan = Scan.new
    # @store = Store.find(params[:id])
    @stores = Store.all # confine to user's stores
  end

  def show
    @scan = Scan.find(params[:id])
  end

  def create
    @scan = Scan.new(scan_params)
    @scan.flyer.attach(params[:scan][:flyer])
    @store = Store.find(params[:id])
    if @scan.save!
      flash[:notice] = "Retrieving informtion from the flyer."
      AddFlyerDataToDbJob.perform_later(@scan)
      render :show, notice: "Added products to the DB. Please double check!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def scan_params
    params.require(:scan, :store).permit(:flyer, :store)
  end
end
