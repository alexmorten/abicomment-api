class OptionsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_option, only: [:show, :update, :destroy]

  # GET /options
  def index
    @options = Option.all

    render json: @options
  end

  # GET /options/1
  def show
    render json: @option
  end

  # POST /options
  def create
   if @current_user.status == "admin" || @current_user.status == "moderator" || @current_user.status == "trusted"
    @option = Option.new(option_params)

    if @option.save
      render json: @option, status: :created, location: @option
    else
      render json: @option.errors, status: :unprocessable_entity
    end
   end
  end

  # PATCH/PUT /options/1
  def update
   if @current_user.status == "admin" || @current_user.status == "moderator" || @current_user.status == "trusted"
    if @option.update(option_params)
      render json: @option
    else
      render json: @option.errors, status: :unprocessable_entity
    end
   end
  end

  # DELETE /options/1
  def destroy
    if @current_user.status == "admin" || @current_user.status == "moderator" || @current_user.status == "trusted"
      @option.destroy
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_option
      @option = Option.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def option_params
      params.require(:option).permit(:title, :poll_id)
    end
end
