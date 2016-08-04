class MottovotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_mottovote, only: [:show, :update, :destroy]

  # GET /mottovotes
  def index
    limit = params[limit] || 20
    @mottovotes = Mottovote.all

    render json: @mottovotes, meta: {total:Mottovote.count}
  end

  # GET /mottovotes/1
  def show
    render json: @mottovote
  end

  # POST /mottovotes
  def create
    if(@motto = Motto.find_by_id(params[:motto_id]))

    if @motto && !@current_user.has_upvoted?(@motto)
      @mottovote = Mottovote.new(mottovote_params)
      @mottovote.user=@current_user
    if @mottovote.save
      render json: @mottovote, status: :created, location: @mottovote
    else
      render json: @mottovote.errors, status: :unprocessable_entity
    end
  end
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
