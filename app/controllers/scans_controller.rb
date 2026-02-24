class ScansController < ApplicationController
  def new
    @scan = Scan.new
  end

  def create
  end

  private

  def scan_params
    params.require(:scan).permit
  end
end
