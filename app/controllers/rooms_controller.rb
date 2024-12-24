class RoomsController < ApplicationController
  before_action :set_hotel, only: [:show, :edit, :update, :destroy]
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms or /rooms.json
  def index
    @hotel = Hotel.find(params[:hotel_id])
    @rooms = @hotel.rooms  # Make sure to fetch rooms for the specific hotel
  end

  # GET /rooms/1 or /rooms/1.json
  def show
    # The room and hotel are already set by before_action, so no need to fetch them again
  end

  # GET /rooms/new
  def new
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.build
  end

  # GET /rooms/1/edit
  def edit
    @hotel = Hotel.find(params[:hotel_id])
    @room = @hotel.rooms.find(params[:id])
  end

  # POST /rooms or /rooms.json
  def create
    @hotel = Hotel.find(params[:hotel_id]) # Ensure @hotel is initialized
    @room = @hotel.rooms.build(room_params)
    if @room.save
      redirect_to hotel_room_path(@hotel, @room)  # Redirect to show the room after it's created
    else
      render :new
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to hotel_room_path(@hotel, @room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy!

    respond_to do |format|
      format.html { redirect_to hotel_rooms_path(@hotel), status: :see_other, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  def set_room
    @room = @hotel.rooms.find_by(id: params[:id]) 
    unless @room
      redirect_to hotel_rooms_path(@hotel), alert: "Room not found."
    end
  end

  def room_params
    params.require(:room).permit(:room_rate)
  end
end
