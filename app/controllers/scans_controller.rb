class ScansController < ApplicationController
  def new
    @scan = Scan.new
  end

  def create
    @scan = Scan.find(scan_params)
  end

  private

  def scan_params
    params.require(:scan).permit(flyers: [])
  end
end
