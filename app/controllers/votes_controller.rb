class VotesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_vote, only: [:show, :update, :destroy]

  # GET /votes
  def index
    @votes = Vote.all

    render json: @votes
  end

  # GET /votes/1
  def show
    render json: @vote
  end

  # POST /votes
  def create
    if(@option = Option.find_by_id(params[:option_id]))
    @poll = @option.poll
    if @option && @poll && !@current_user.voted_for?(@poll)
      @vote = Vote.new(vote_params)
      @vote.user = @current_user
      if @vote.save
        render json: @vote, status: :created, location: @vote
      else
        render json: @vote.errors, status: :unprocessable_entity
      end
    end
  end
  end

  # PATCH/PUT /votes/1


  # DELETE /votes/1
  def destroy
    if @vote.user == @current_user || @current_user.status == "admin"
    @vote.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vote_params
      params.require(:vote).permit(:user_id, :option_id)
    end
end
