class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:show, :update, :destroy]

  # GET /courses
  def index
    @courses = Course.order(name: :desc)

    render json: @courses
  end

  # GET /courses/1
  def show
    render json: @course
  end

  # POST /courses
  def create
    if(@current_user.status == "moderator" || @current_user.status == "admin" || @current_user.status == "trusted")
    @course = Course.new(course_params)
    @course.creator=@current_user
    if @course.save
      render json: @course, status: :created, location: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end
  end

  # PATCH/PUT /courses/1
  def update
    if(@current_user.status == "admin" || @course.creator == @current_user || @current_user.status == "trusted")
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end
  end

  # DELETE /courses/1
  def destroy
      if( @current_user.status == "admin" || @course.creator == @current_user || @current_user.status == "trusted")
      Log.create(user:@current_user,kind:"deleted",catagory:"couse",text:"id: "+@course.id.to_s+" ,name:"+@course.name+" ,teacher: "+@course.teacher)
    @course.destroy
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:teacher, :name)
    end
end
