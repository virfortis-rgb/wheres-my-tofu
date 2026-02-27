class ScansController < ApplicationController
  def new
    @scan = Scan.new
  end

  def show
    @scan = Scan.find(params[:id])
  end

  def create
    @scan = Scan.new(scan_params)
    @scan.flyer.attach(params[:scan][:flyer] )
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
    params.require(:scan).permit(:flyer)
  end
end
