class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    #@event = Event.new(event_params)
    @meeting = Meeting.find(params[:meeting_id])
    @event = @meeting.events.create(event_params)
    redirect_to meeting_path(@meeting)
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @meeting = Meeting.find(params[:meeting_id])
      if @event.update(event_params)

        redirect_to meeting_path(@meeting)
        
      else
        render 'edit'
        
      end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @meeting = Meeting.find(params[:meeting_id])
    @event.destroy
    redirect_to meeting_path(@meeting)
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @meeting = Meeting.find(params[:meeting_id])
      @event = @meeting.events.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :desc, :date, :place, :member, :meeting_id)
    end
end
