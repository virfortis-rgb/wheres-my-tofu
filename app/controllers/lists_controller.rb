class ListsController < ApplicationController
  before_action :get_list, only: [:show]
  def index
    @lists = List.all
  end

  def new
  end

  def create
  end

  def show
  end

  def destroy
  end

  private

  def get_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
