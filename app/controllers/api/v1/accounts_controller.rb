class Api::V1::AccountsController < ApplicationController
  before_action :set_account, only: [:show, :update, :destroy]

  # GET /accounts
  def index
    @accounts = Account.all

    render json: @accounts
  end

  # GET /accounts/1
  def show
    # @account = Account.find(params[:id]) => video include this code
    render json: @account
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)

    if @account.save
      render json: @account
      # , status: :created, location: @account
      # render json: @account => video code
    else
      render json: @account.errors, status: :unprocessable_entity
      # render json: {error: 'Error creating account'} video code
    end
  end

  # PATCH/PUT /accounts/1
  def update
    @account.update(name: params['account']['name'])
    @account.save
    render json: @account
    # if @account.update(account_params)
    #   render json: @account
    # else
    #   render json: @account.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /accounts/1
  def destroy
    # @account = Account.find(params[:id]) => video include this code
    @account.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      @account = Account.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def account_params
      params.require(:account).permit(:first_name, :last_name, :username, :email, :image_url, presence: true)
    end
end
