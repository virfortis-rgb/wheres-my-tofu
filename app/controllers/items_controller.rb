class ItemsController < ApplicationController
  before_action :set_list
  before_action :set_item, only: [:show, :update, :destroy]

  def attach
    @item = @list.items.new(name: params[:query], keyword: params[:query].downcase, quantity: 1)
    # @item.quantity = 1
    if @item.save!
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to list_path(@list), notice: "Item added." }
      end
    else
      redirect_to list_path(@list), alert: "Could not add item."
    end
  end

  def show
  end

def update
    if @item.update(item_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to list_path(@list), notice: 'Item was successfully updated.' }
      end
    else
      redirect_to list_path(@list), alert: 'Failed to update item.'
    end
  end

  def destroy
    @item.destroy
    redirect_to list_path(@list), notice: 'Item was successfully removed.'
  end

  private

  def set_list
    @list = current_user.lists.find(params[:list_id])
  end

  def set_item
    @item = @list.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :quantity, :price_id)
  end
end
