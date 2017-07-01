class PromtablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_promtable, only: [:show, :update, :destroy]

  # GET /promtables
  def index
    @promtables = Promtable.all

    render json: @promtables, current_user: @current_user, include: ['promtableentries','users']
  end

  # GET /promtables/1
  def show
    render json: @promtable, current_user: @current_user
  end

  # POST /promtables
  def create

    @promtable = Promtable.new(promtable_params)
    if @current_user.status == "admin"
      if @promtable.save
        render json: @promtable, status: :created, location: @promtable, current_user: @current_user
      else
        render json: @promtable.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /promtables/1
  def update
    if @current_user.status == "admin"
      if @promtable.update(promtable_params)
        render json: @promtable, current_user: @current_user
      else
        render json: @promtable.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /promtables/1
  def destroy
    if @current_user.status == "admin"
      @promtable.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promtable
      @promtable = Promtable.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def promtable_params
      params.require(:promtable).permit(:user_id, :seats)
    end
end
