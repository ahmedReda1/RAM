class EventusersController < ApplicationController
  before_action :set_eventuser, only: [:show, :edit, :update, :destroy]

  # GET /eventusers
  # GET /eventusers.json
  def index
    @eventusers = Eventuser.all
  end

  # GET /eventusers/1
  # GET /eventusers/1.json
  def show
  end

  # GET /eventusers/new
  def new
    @eventuser = Eventuser.new
  end

  # GET /eventusers/1/edit
  def edit
  end

  # POST /eventusers
  # POST /eventusers.json
  def create
   

    @event = Event.find(params[:event_id])
     @eventuser = @event.eventusers.create(eventuser_params)
    x=@event.member+1
    @event.update(:member=>x)
    redirect_to meeting_event_path(@event.meeting_id,@event.id)
  end

  # PATCH/PUT /eventusers/1
  # PATCH/PUT /eventusers/1.json
  def update
    respond_to do |format|
      if @eventuser.update(eventuser_params)
        format.html { redirect_to @eventuser, notice: 'Eventuser was successfully updated.' }
        format.json { render :show, status: :ok, location: @eventuser }
      else
        format.html { render :edit }
        format.json { render json: @eventuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventusers/1
  # DELETE /eventusers/1.json
  def destroy
    @eventuser.destroy
    respond_to do |format|
      format.html { redirect_to eventusers_url, notice: 'Eventuser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventuser
      @eventuser = Eventuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eventuser_params
      params.require(:eventuser).permit(:event_id, :user_id)
    end
end
