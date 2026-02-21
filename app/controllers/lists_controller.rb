class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = current_user.lists
  end

  def show
    @items = @list.items
    @item = Item.new
    product_ids = @items.flat_map { |item| item.find_products.ids }
    store_ids = Price.where(product_id: product_ids).distinct.pluck(:store_id)
    @stores = Store.where(id: store_ids)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: 'List was successfully deleted.'
  end

  private

  def set_list
    @list = current_user.lists.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end
end
