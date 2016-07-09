class LogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_log, only: [:show, :update, :destroy]

  # GET /logs
  def index
    if @current_user.status=="admin"
    @logs = Log.all
    end
    render json: @logs
  end

  # GET /logs/1
  def show
    if @current_user.status=="admin"

    render json: @log
  end
  end

  # POST /logs
  # def create
  #   @log = Log.new(log_params)
  #
  #   if @log.save
  #     render json: @log, status: :created, location: @log
  #   else
  #     render json: @log.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /logs/1
  def update
    if @current_user.status=="admin"

    if @log.update(log_params)
      render json: @log
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end
  end

  # DELETE /logs/1
  def destroy
    if @current_user.status=="admin"
    @log.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def log_params
      params.require(:log).permit(:text, :user_id)
    end
end
