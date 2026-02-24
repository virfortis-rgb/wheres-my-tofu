class ScansController < ApplicationController
  def new
    @scan = Scan.new
  end

  def create
    @scan = Scan.find(scan_params)
    if @scan.flyer.attached?
      # TODO give pdf background job
      render "shared/scan", notice: "Added products to the DB. Please double check!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def scan_params
    params.require(:scan).permit(flyers: [])
  end
end
