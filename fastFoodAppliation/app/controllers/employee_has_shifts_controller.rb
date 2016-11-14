class EmployeeHasShiftsController < ApplicationController
  before_action :set_employee_has_shift, only: [:show, :edit, :update, :destroy]

  # GET /employee_has_shifts
  # GET /employee_has_shifts.json
  def index
    @employee_has_shifts = EmployeeHasShift.all
  end

  # GET /employee_has_shifts/1
  # GET /employee_has_shifts/1.json
  def show
  end

  # GET /employee_has_shifts/new
  def new
    @employee_has_shift = EmployeeHasShift.new
  end

  # GET /employee_has_shifts/1/edit
  def edit
  end

  # POST /employee_has_shifts
  # POST /employee_has_shifts.json
  def create
    @employee_has_shift = EmployeeHasShift.new(employee_has_shift_params)

    respond_to do |format|
      if @employee_has_shift.save
        format.html { redirect_to @employee_has_shift, notice: 'Employee has shift was successfully created.' }
        format.json { render :show, status: :created, location: @employee_has_shift }
      else
        format.html { render :new }
        format.json { render json: @employee_has_shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_has_shifts/1
  # PATCH/PUT /employee_has_shifts/1.json
  def update
    respond_to do |format|
      if @employee_has_shift.update(employee_has_shift_params)
        format.html { redirect_to @employee_has_shift, notice: 'Employee has shift was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_has_shift }
      else
        format.html { render :edit }
        format.json { render json: @employee_has_shift.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_has_shifts/1
  # DELETE /employee_has_shifts/1.json
  def destroy
    @employee_has_shift.destroy
    respond_to do |format|
      format.html { redirect_to employee_has_shifts_url, notice: 'Employee has shift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_has_shift
      @employee_has_shift = EmployeeHasShift.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_has_shift_params
      params.require(:employee_has_shift).permit(:employee_id, :shift_id)
    end
end
