class QuotesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_quote, only: [:show, :update, :destroy]
  # GET /quotes
  def index
    limit = params[:limit] || 20
    query = params[:query] || ""
    @quotes = Quote.order(created_at: :desc).where("LOWER(text) LIKE LOWER(?) OR LOWER(quoted) LIKE LOWER(?)","%#{query}%","%#{query}%").limit(limit)

    render json: @quotes, meta:{ total:Quote.where("LOWER(text) LIKE LOWER(?) OR LOWER(quoted) LIKE LOWER(?)","%#{query}%","%#{query}%").count}
  end

  # GET /quotes/1
  def show
    render json: @quote
  end

  # POST /quotes
  def create
    @quote = Quote.new(quote_params)
    @quote.user = @current_user
    if @quote.save
      render json: @quote, status: :created, location: @quote
    else
      render json: @quote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quotes/1
  def update
    if(@current_user == @quote.user || @current_user.status == "admin")
    if @quote.update(quote_params)
      render json: @quote
    else
      render json: @quote.errors, status: :unprocessable_entity
    end
    end
  end

  # DELETE /quotes/1
  def destroy
    if(@current_user == @quote.user || @current_user.status == "admin")
    Log.create(user:@current_user,kind:"deleted",catagory:"quote",text:"id: "+@quote.id.to_s+" ,quoted:"+@quote.quoted+" ,text:"+@quote.text+" ,created by: "+@quote.user.forename+" "+@quote.user.name)
    @quote.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quote_params
      params.require(:quote).permit(:text, :quoted, :user_id)
    end
end
