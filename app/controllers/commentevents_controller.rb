class CommenteventsController < ApplicationController
  before_action :set_commentevent, only: [:show, :edit, :update, :destroy]

  # GET /commentevents
  # GET /commentevents.json
  def index
    @commentevents = Commentevent.all
  end

  # GET /commentevents/1
  # GET /commentevents/1.json
  def show
  end

  # GET /commentevents/new
  def new
    @commentevent = Commentevent.new
  end

  # GET /commentevents/1/edit
  def edit
  end

  # POST /commentevents
  # POST /commentevents.json
  def create
    @event = Event.find(params[:event_id])
    @comment = @event.commentevents.create(commentevent_params)
    redirect_to meeting_event_path(@event.meeting_id,@event.id)

  end

  # PATCH/PUT /commentevents/1
  # PATCH/PUT /commentevents/1.json
  def update
    @event = Event.find(params[:event_id])
      if @commentevent.update(commentevent_params)
          redirect_to meeting_event_path(@event.meeting_id,@event.id)
        
      else
        render 'edit'
        
      end
  end

  # DELETE /commentevents/1
  # DELETE /commentevents/1.json
  def destroy
    
    @event = Event.find(params[:event_id])
   # @commentevent = @event.commentevents.find(params[:id])
    @commentevent.destroy
    redirect_to meeting_event_path(@event.meeting_id,@event.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commentevent
      @commentevent = Commentevent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def commentevent_params
      params.require(:commentevent).permit(:event_id, :user_id, :commentbody)
    end
end
