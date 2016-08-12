class EmployeesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
    @people = Person.order("created_at desc").all
    @functions = Function.order("created_at desc").all
  end

  # GET /employees/1/edit
  def edit
    @people = Person.order("created_at desc").all
    @functions = Function.order("created_at desc").all
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)
    @e_functions = Function.where(:id => params[:employee_functions])
    @employee.functions << @e_functions

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'El funcionario ha sido añadido satisfactoriamente.' }
        format.json { render :show, status: :created, location: @employee }
      else
        @people = Person.order("created_at desc").all
        @functions = Function.order("created_at desc").all
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    @employee = Employee.find(params[:employee])
    @e_functions = Function.where(:id => params[:employee_functions])
    @employee.functions.destroy_all
    @employee.functions << @e_functions

    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'El funcionario ha sido actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        @people = Person.order("created_at desc").all
        @functions = Function.order("created_at desc").all
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
      format.html { redirect_to employees_url, notice: 'El funcionario ha sido eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:person_id, :contract_date, :attachment)
    end
end
