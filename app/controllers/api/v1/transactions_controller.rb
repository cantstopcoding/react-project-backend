class Api::V1::TransactionsController < ApplicationController
  before_action :set_account
  # before_action :set_transaction, only: [:show, :update, :destroy]

  # GET /transactions
  def index
    @transactions = @account.transactions

    render json: @transactions
  end

  # GET /transactions/1
  def show
    render json: @transaction
  end

  # POST /transactions
  def create
    @transaction = @account.transactions.new(transaction_params)
    
    if @account.update_balance(@transaction) != 'Balance too low.' 
      @transaction.save
      render json: @account
      # render json: @transaction, status: :created, location: @transaction
    else
      # render json: @transaction.errors, status: :unprocessable_entity
      render json: {error: 'Balance too low.'} #=> in video
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    # binding.pry 
    @transaction = Transaction.find(params['id'])
    @account = Account.find(@transaction.account_id)
    @transaction.destroy
    render json: @account
    # it matters that it's an instance variable, video at approx. 34:20
  end

  private
    
  def set_account
    @account = Account.find(params[:account_id])
  end

    # Use callbacks to share common setup or constraints between actions.
    # def set_transaction
    #   @transaction = Transaction.find(params[:id])
    # end

    # Only allow a trusted parameter "white list" through.
    def transaction_params
      params.require(:transaction).permit(:account_id, :amount, :kind, :date, :description)
    end
end
