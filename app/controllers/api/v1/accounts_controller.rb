class Api::V1::AccountsController < ApplicationController
  before_action :set_account, only: [:show, :update, :destroy]

  def index
    @accounts = Account.all

    render json: @accounts
  end

  def show
    render json: @account
  end

  def create
    @account = Account.new(account_params)

    if @account.save
      render json: @account
    else
      error_response = {
        error: @account.errors.full_messages.to_sentence,
      }
      render json: error_response, status: :unprocessable_entity
    end
  end

  def update
    if @account.update(account_params)
      @account.save
      render json: @account
    else
      error_response = {
        error: @account.errors.full_messages.to_sentence,
      }
      render json: error_response, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy
    @accounts = Account.all
    render json: @accounts
  end

  private

  def set_account
    @account = Account.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:id, :first_name, :last_name, :username, :email, :image_url)
  end
end
