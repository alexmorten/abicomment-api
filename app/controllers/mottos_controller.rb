class MottosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_motto, only: [:show, :update, :destroy]

  # GET /mottos
  def index
    limit = params[:limit] || 20
    @mottos = Motto.order(mottovotes.count: :desc).limit(limit)

    render json: @mottos
  end

  # GET /mottos/1
  def show
    render json: @motto
  end

  # POST /mottos
  def create
    @motto = Motto.new(motto_params)

    if @motto.save
      render json: @motto, status: :created, location: @motto
    else
      render json: @motto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mottos/1
  def update
    if(@current_user == @motto.user || @current_user.status == "admin" || @current_user.status == "moderator")
    if @motto.update(motto_params)
      render json: @motto
    else
      render json: @motto.errors, status: :unprocessable_entity
    end
  end
  end

  # DELETE /mottos/1
  def destroy
    if(@current_user == @motto.user || @current_user.status == "admin" || @current_user.status == "moderator")
      Log.create(user:@current_user,kind:"deleted",catagory:"motto",text:"id: "+@motto.id.to_s+" ,motto: "+@motto.text+" ,created by:"+@motto.user.forename+" "+@motto.user.name)

      @motto.destroy
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motto
      @motto = Motto.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def motto_params
      params.require(:motto).permit(:user_id, :text)
    end
end
