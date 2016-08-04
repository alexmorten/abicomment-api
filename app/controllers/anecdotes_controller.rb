class AnecdotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_anecdote, only: [:show, :update, :destroy]

  # GET /anecdotes
  def index
    limit = params[:limit] || 20
    @anecdotes = Anecdote.order(created_at: :desc).limit(limit)
    render json: @anecdotes, meta:{total:Anecdote.count}
  end

  # GET /anecdotes/1
  def show
    render json: @anecdote
  end

  # POST /anecdotes
  def create
    @anecdote = Anecdote.new(anecdote_params)
    @anecdote.user=@current_user
    if @anecdote.save
      render json: @anecdote, status: :created, location: @anecdote
    else
      render json: @anecdote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /anecdotes/1
  def update
  if(@current_user == @quote.user || @current_user.status == "admin")
    if @anecdote.update(anecdote_params)
      render json: @anecdote
    else
      render json: @anecdote.errors, status: :unprocessable_entity
    end
  end
  end

  # DELETE /anecdotes/1
  def destroy
      if(@current_user == @anecdote.user || @current_user.status == "admin")
        Log.create(user:@current_user,kind:"deleted",catagory:"ancedote",text:"id: "+@anecdote.id.to_s+",course_id: "+@anecdote.course.id.to_s+" ,course_name:"+@anecdote.course.name+" ,text: "+@anecdote.text)
        @anecdote.destroy
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anecdote
      @anecdote = Anecdote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def anecdote_params
      params.require(:anecdote).permit(:text, :user_id, :course_id)
    end
end
