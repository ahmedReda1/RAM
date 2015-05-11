class MeetusersController < ApplicationController
  before_action :set_meetuser, only: [:show, :edit, :update, :destroy]

  # GET /meetusers
  # GET /meetusers.json
  def index
    @meetusers = Meetuser.all
  end

  # GET /meetusers/1
  # GET /meetusers/1.json
  def show
  end

  # GET /meetusers/new
  def new
    @meetuser = Meetuser.new
  end

  # GET /meetusers/1/edit
  def edit
  end

  # POST /meetusers
  # POST /meetusers.json
  def create
    @meeting = Meeting.find(params[:meeting_id])
    @meetuser = @meeting.meetusers.create(meetuser_params)
    
     redirect_to meeting_path(@meeting)
  end

  # PATCH/PUT /meetusers/1
  # PATCH/PUT /meetusers/1.json
  def update
    respond_to do |format|
      if @meetuser.update(meetuser_params)
        format.html { redirect_to @meetuser, notice: 'Meetuser was successfully updated.' }
        format.json { render :show, status: :ok, location: @meetuser }
      else
        format.html { render :edit }
        format.json { render json: @meetuser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetusers/1
  # DELETE /meetusers/1.json
  def destroy
    @meetuser.destroy
    respond_to do |format|
      format.html { redirect_to meetusers_url, notice: 'Meetuser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meetuser
      @meetuser = Meetuser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meetuser_params
      params.require(:meetuser).permit(:meeting_id, :user_id)
    end
end
