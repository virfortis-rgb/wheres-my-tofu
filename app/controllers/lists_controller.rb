class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy, :favorite_stores]

  def index
    @lists = current_user.lists
  end

  def show
    @items = @list.filtered_items
    @stores = Store.order(:name)
    @item = Item.new
  end

  def favorite_stores
    selected_store_ids = if params[:clear_filter].present?
      []
    else
      Array(params.dig(:list, :favorite_store_ids)).reject(&:blank?).map(&:to_i)
    end

    @list.favorite_store_ids = Store.where(id: selected_store_ids).pluck(:id)
    sync_item_prices_with_store_filter(selected_store_ids)

    redirect_to list_path(@list), notice: "Favorite stores updated."
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to list_path(@list), notice: "List was successfully created."
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

  def sync_item_prices_with_store_filter(selected_store_ids)
    return if selected_store_ids.blank?

    @list.items.includes(:price).find_each do |item|
      next if item.price&.store_id.in?(selected_store_ids)

      replacement_price = item.lowest_available_price_for(store_ids: selected_store_ids)
      item.update!(price: replacement_price) if replacement_price
    end
  end
end
