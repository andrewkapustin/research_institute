class EmployeeProjectCommunicationsController < ApplicationController
  before_action :set_employee_project_communication, only: [:show, :edit, :update, :destroy]

  # GET /employee_project_communications
  # GET /employee_project_communications.json
  def index
    @employee_project_communications = EmployeeProjectCommunication.all
  end

  # GET /employee_project_communications/1
  # GET /employee_project_communications/1.json
  def show
  end

  # GET /employee_project_communications/new
  def new
    @employee_project_communication = EmployeeProjectCommunication.new
  end

  # GET /employee_project_communications/1/edit
  def edit
  end

  # POST /employee_project_communications
  # POST /employee_project_communications.json
  def create
    @employee_project_communication = EmployeeProjectCommunication.new(employee_project_communication_params)

    respond_to do |format|
      if @employee_project_communication.save
        format.html { redirect_to @employee_project_communication, notice: 'Employee project communication was successfully created.' }
        format.json { render :show, status: :created, location: @employee_project_communication }
      else
        format.html { render :new }
        format.json { render json: @employee_project_communication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_project_communications/1
  # PATCH/PUT /employee_project_communications/1.json
  def update
    respond_to do |format|
      if @employee_project_communication.update(employee_project_communication_params)
        format.html { redirect_to @employee_project_communication, notice: 'Employee project communication was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_project_communication }
      else
        format.html { render :edit }
        format.json { render json: @employee_project_communication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_project_communications/1
  # DELETE /employee_project_communications/1.json
  def destroy
    @employee_project_communication.destroy
    respond_to do |format|
      format.html { redirect_to employee_project_communications_url, notice: 'Employee project communication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_project_communication
      @employee_project_communication = EmployeeProjectCommunication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_project_communication_params
      params.require(:employee_project_communication).permit(:project_id, :employee_id)
    end
end
