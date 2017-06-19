class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  def search
    if params.has_key?('search')
      @employees = Employee.search(params['search'])
    else
      @employees = []
    end
    params['search'] ||= {}
    @old_name=params.has_key?('search') ? params[:search][:name_dep] : ""
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    # raise params.to_s
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Работник создан.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    # raise params.to_s
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Работник обновлен.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to employees_url, notice: 'Работник удален.' }
      format.json { head :no_content }
    end
  end

  def department_fields
    id = params[:department_id].to_i
    if id > 0
      @department = Department.find(id)
    else
      @department = nil
    end
    # raise @department.inspect
    respond_to do |format|
      format.js
    end
  end

  def project_fields
    id = params[:project_id].to_i
    @project = Project.find(id)
    @timestamp = params[:timestamp].to_i
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :patronymic, :passport,
      :itn, :date_of_birth, :post, :departament_id,
      :departament_attributes => [:name, :id],
      employee_project_communications_attributes: [:_destroy, :project_id, :id,
        project_attributes: Project.attributes_names.map(&:to_sym).push(:_destroy)])
end
end
