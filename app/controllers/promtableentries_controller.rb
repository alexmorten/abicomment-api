class PromtableentriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_promtableentry, only: [:show, :update, :destroy]

  # GET /promtableentries
  def index
    @promtableentries = Promtableentry.all

    render json: @promtableentries
  end

  # GET /promtableentries/1
  def show
    render json: @promtableentry
  end

  # POST /promtableentries
  def create
    @promtableentry = Promtableentry.new(promtableentry_params)
    promtable = @promtableentry.promtable
    @promtableentry.user = @current_user
    if promtable.free >= @promtableentry.seats
      if @promtableentry.save
        render json: @promtableentry, status: :created, location: @promtableentry
      else
        render json: @promtableentry.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /promtableentries/1
  def update
    if @promtableentry.user == @current_user
      if @promtableentry.update(promtableentry_params)
        render json: @promtableentry
      else
        render json: @promtableentry.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /promtableentries/1
  def destroy
    if @promtableentry.user == @current_user
      @promtableentry.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promtableentry
      @promtableentry = Promtableentry.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def promtableentry_params
      params.require(:promtableentry).permit(:promtable_id, :user_id, :seats)
    end
end
