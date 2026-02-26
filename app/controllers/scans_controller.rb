class ScansController < ApplicationController
  def new
    @scan = Scan.new
  end

  def create
    @scan = Scan.new(scan_params)
    if @scan.save!
      AddFlyerDataToDbJob.perform_later(@scan)
      # render "scans/:id", notice: "Added products to the DB. Please double check!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def scan_params
    params.require(:scan).permit(:content, :file)
  end
end
