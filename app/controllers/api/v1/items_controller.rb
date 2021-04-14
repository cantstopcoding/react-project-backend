class Api::V1::ItemsController < ApplicationController
  before_action :set_account
  # before_action :set_item, only: [:show, :update, :destroy]

  # GET /items
  def index
    @items = @account.items

    render json: @items
  end

  # GET /items/1
  def show
    @item = Item.find(params["id"])
    render json: @item
  end

  # POST /items
  def create
    # binding.pry
    @item = @account.items.new(item_params)
    if @item.save
      render json: @account
      # render json: @item, status: :created, location: @item
    else
      error_response = {
        error: @item.errors.full_messages.to_sentence,
      }
      render json: error_response, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items/1
  def update
    if @item.update(item_params)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items/1
  def destroy
    # binding.pry
    @item = Item.find(params["id"])
    @item.destroy
    @account = Account.find(@item.account_id)
    render json: @account

    # @item = Item.find(params["id"])
    # @account = Account.find(@item.account_id)
    # if @account.update_balance_on_delete(@item)
    #   @item.destroy
    #   render json: @account
    # else
    #   render json: @item.errors, status: :unprocessable_entity
    # end
    # it matters that it's an instance variable, video at approx. 34:20
  end

  private

  def set_account
    @account = Account.find(params[:account_id])
    # @item = Item.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  # def set_item
  #   @item = item.find(params[:id])
  # end

  # Only allow a trusted parameter "white list" through.
  def item_params
    params.require(:item).permit(:account_id, :name, :image_url, :description, :price)
  end
end
