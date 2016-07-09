class CommentsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.commentor = @current_user
    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if(@current_user == @comment.user || @current_user == @comment.commentor || @current_user.status == "admin")
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end
  end

  # DELETE /comments/1
  def destroy
    if(@current_user == @comment.user || @current_user == @comment.commentor || @current_user.status == "admin")
    Log.create(user:@current_user,kind:"deleted",catagory:"comment",text:"id: "+@comment.id.to_s+" ,comment: "+@comment.text+" ,created for:"+@comment.user.forename+" "+@comment.user.name+" ,created by: "+@comment.commentor.forename+" "+@comment.commentor.name)

    @comment.destroy
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:text, :user_id)
    end
end
