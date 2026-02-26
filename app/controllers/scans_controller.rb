class ScansController < ApplicationController
  def new
    @scan = Scan.new
  end

  def create
    @scan = Scan.new(scan_params)
    if @scan.save!
      AddFlyerDataToDbJob.perform_later(@scan), notice: "Flyer Data has been added to the DataBase!"
      # render "scans/:id", notice: "Added products to the DB. Please double check!"

      render :new, status: :unprocessable_entity
    end
  end

  private

  def scan_params
    params.require(:scan).permit(flyers: [])
  end
end
