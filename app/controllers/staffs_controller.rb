class StaffsController < ApplicationController
  before_action :set_hotel, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  before_action :set_staff, only: [:show, :edit, :update, :destroy]

  # GET /hotels/:hotel_id/staffs
  def index
    @staffs = @hotel.staffs
  end

  # GET /hotels/:hotel_id/staffs/:id
  def show
  end

  # GET /hotels/:hotel_id/staffs/new
  def new
    @staff = @hotel.staffs.build
  end

  # GET /hotels/:hotel_id/staffs/:id/edit
  def edit
  end

  # POST /hotels/:hotel_id/staffs
  def create
    @staff = @hotel.staffs.build(staff_params)

    if @staff.save
      redirect_to hotel_staff_path(@hotel, @staff), notice: 'Staff was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hotels/:hotel_id/staffs/:id
  def update
    if @staff.update(staff_params)
      redirect_to hotel_staff_path(@hotel, @staff), notice: 'Staff was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /hotels/:hotel_id/staffs/:id
  def destroy
    @staff.destroy
    redirect_to hotel_staffs_path(@hotel), status: :see_other, notice: 'Staff was successfully destroyed.'
  end

  private

  def set_hotel
    @hotel = Hotel.find_by(id: params[:hotel_id])
    redirect_to hotels_path, alert: 'Hotel not found.' if @hotel.nil?
  end

  def set_staff
    @staff = @hotel.staffs.find_by(id: params[:id])
    redirect_to hotel_staffs_path(@hotel), alert: 'Staff not found.' if @staff.nil?
  end

  def staff_params
    params.require(:staff).permit(:name, :work, :salary, :contact)
  end
end
