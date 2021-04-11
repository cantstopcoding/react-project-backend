class Api::V1::AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :update, :destroy]

  # GET /admins
  def index
    @admins = Admin.all

    render json: @admins
  end

  # GET /admins/1
  def show
    # @admin = Admin.find(params[:id]) => video include this code
    render json: @admin
  end

  # POST /admins
  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      render json: @admin
      # , status: :created, location: @admin
      # render json: @admin => video code
    else
      render json: @admin.errors, status: :unprocessable_entity
      # render json: {error: 'Error creating admin'} video code
    end
  end

  # PATCH/PUT /admins/1
  def update
    @admin.update(name: params['admin']['name'])
    @admin.save
    render json: @admin
    # if @admin.update(admin_params)
    #   render json: @admin
    # else
    #   render json: @admin.errors, status: :unprocessable_entity
    # end
  end

  # DELETE /admins/1
  def destroy
    # @admin = Admin.find(params[:id]) => video include this code
    @admin.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_params
      params.require(:admin).permit(:name, :balance)
    end
end
