class MottovotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mottovote, only: [:show, :update, :destroy]

  # GET /mottovotes
  def index
    limit = params[limit] || 20
    @mottovotes = Mottovote.all

    render json: @mottovotes
  end

  # GET /mottovotes/1
  def show
    render json: @mottovote
  end

  # POST /mottovotes
  def create
    @mottovote = Mottovote.new(mottovote_params)

    if @mottovote.save
      render json: @mottovote, status: :created, location: @mottovote
    else
      render json: @mottovote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mottovotes/1
  def update
    if(@current_user == @mottovote.user || @current_user.status == "admin")
    if @mottovote.update(mottovote_params)
      render json: @mottovote
    else
      render json: @mottovote.errors, status: :unprocessable_entity
    end
    end
  end

  # DELETE /mottovotes/1
  def destroy
    if(@current_user == @mottovote.user || @current_user.status == "admin")
      Log.create(user:@current_user,kind:"deleted",catagory:"mottovote",text:"id: "+@mottovote.id.to_s+" ,motto: "+@mottovote.motto.text+" ,created by:"+@mottovote.user.forename+" "+@mottovote.user.name)
      @mottovote.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mottovote
      @mottovote = Mottovote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mottovote_params
      params.require(:mottovote).permit(:user_id, :motto_id, :note)
    end
end
