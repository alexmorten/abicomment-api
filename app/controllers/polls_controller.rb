class PollsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_poll, only: [:show, :update, :destroy]

  # GET /polls
  def index
    limit = params[:limit] || 10
    query = params[:query] || ""
    @polls = Poll.order(created_at: :desc).where("LOWER(topic) LIKE LOWER( ? )","%#{query}%").limit(params[:limit])

    render json: @polls, meta:{total:Poll.where("LOWER(topic) LIKE LOWER( ? )","%#{query}%").count}
  end

  # GET /polls/1
  def show
    render json: @poll, include: ['options']
  end

  # POST /polls
  def create
    if @current_user.status == "admin" || @current_user.status == "moderator"
      @poll = Poll.new(poll_params)
      @poll.user=@current_user
      if @poll.save
        render json: @poll, status: :created, location: @poll
      else
        render json: @poll.errors, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /polls/1
  def update
   if @current_user.status == "admin" || @current_user.status == "moderator"

    if @poll.update(poll_params)
      render json: @poll, include: ['options']
    else
      render json: @poll.errors, status: :unprocessable_entity
    end
   end
  end

  # DELETE /polls/1
  def destroy
    if @current_user.status == "admin" || @current_user.status == "moderator"
      Log.create(user:@current_user,kind:"deleted",catagory:"poll",text:"id: "+@poll.id.to_s+" ,poll: "+@poll.topic+" ,created by:"+@poll.user.forename+" "+@poll.user.name)

      @poll.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def poll_params
      params.require(:poll).permit(:topic)
    end
end
