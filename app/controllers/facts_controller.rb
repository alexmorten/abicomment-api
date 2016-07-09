class FactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_fact, only: [:show, :update, :destroy]

  # GET /facts
  def index
    limit = params[:limit] || 20
    @facts = Fact.order(created_at: :desc).limit(limit)

    render json: @facts, meta:{total:Fact.count}
  end

  # GET /facts/1
  def show
    render json: @fact
  end

  # POST /facts
  def create
    @fact = Fact.new(fact_params)
    @fact.user=@current_user
    if @fact.save
      render json: @fact, status: :created, location: @fact
    else
      render json: @fact.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /facts/1
  def update
    if @fact.update(fact_params)
      render json: @fact
    else
      render json: @fact.errors, status: :unprocessable_entity
    end
  end

  # DELETE /facts/1
  def destroy
    if @current_user==@fact.user || @current_user.status=="admin" || @current_user.status=="moderator"
    Log.create(user:@current_user,kind:"deleted",catagory:"fact",text:"id: "+@fact.id.to_s+" ,text:"+@fact.text+" ,created by: "+@fact.user.forename+" "+@fact.user.name)

    @fact.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fact
      @fact = Fact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fact_params
      params.require(:fact).permit(:user_id, :text)
    end
end
