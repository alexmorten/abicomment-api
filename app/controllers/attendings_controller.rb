class AttendingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_attending, only: [:show, :update, :destroy]

  # GET /attendings
  def index
    @attendings = Attending.all

    render json: @attendings
  end

  # GET /attendings/1
  def show
    render json: @attending
  end

  # POST /attendings
  def create
    @attending = Attending.new(attending_params)
    if !@current_user.is_attending?(@attending.course)
    @attending.user=@current_user
    if @attending.save
      render json: @attending, status: :created, location: @attending
    else
      render json: @attending.errors, status: :unprocessable_entity
    end
  else
    render json: {error: "unprocessable entity"}, status: 422
  end
  end

  # PATCH/PUT /attendings/1
  def update
    if(@current_user == @attending.user || @current_user.status == "admin")
    if @attending.update(attending_params)
      render json: @attending
    else
      render json: @attending.errors, status: :unprocessable_entity
    end
  end
  end

  # DELETE /attendings/1
  def destroy
  if(@current_user == @attending.user || @current_user.status == "admin")
      Log.create(user:@current_user,kind:"deleted",catagory:"attending",text:"id: "+@attending.id.to_s+",course_id: "+@attending.course.id.to_s+" ,course_name:"+@attending.course.name+" ,user: "+@attending.user.forename+" "+@attending.user.name)
    @attending.destroy
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attending
      @attending = Attending.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attending_params
      params.require(:attending).permit(:course_id, :user_id, :note)
    end
end
