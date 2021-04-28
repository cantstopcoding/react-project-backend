class Api::V1::ItemsController < ApplicationController
  before_action :set_account
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    @items = @account.items
    render json: @items
  end

  def show
    render json: @item
  end

  def create
    @item = @account.items.new(item_params)
    if @item.save
      render json: @account
    else
      error_response = {
        error: @item.errors.full_messages.to_sentence,
      }
      render json: error_response, status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      render json: @account
    else
      error_response = {
        error: @item.errors.full_messages.to_sentence,
      }
      render json: error_response, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    @account = Account.find(@item.account_id)
    render json: @account
  end

  private

  def set_account
    @account = Account.find(params[:account_id])
  end

  def set_item
    @item = Item.find(params["id"])
  end

  def item_params
    params.require(:item).permit(:id, :account_id, :name, :image_url, :description, :price)
  end
end
