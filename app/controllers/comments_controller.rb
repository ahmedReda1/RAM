class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @meeting = Meeting.find(params[:meeting_id])
    @comment = @meeting.comments.create(comment_params)
    redirect_to meeting_path(@meeting)

  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
      @meeting = Meeting.find(params[:meeting_id])
      if @comment.update(comment_params)
        redirect_to @meeting
        
      else
        render 'edit'
        
      end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @meeting = Meeting.find(params[:meeting_id])
    @comment.destroy
    redirect_to meeting_path(@meeting)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:meeting_id, :user_id, :commentbody)
    end
end
