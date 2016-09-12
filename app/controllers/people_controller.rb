class PeopleController < ApplicationController
  before_action :authenticate_user!
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.paginate(:page => params[:page], :per_page => 5)
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  def new_address_person
    addresses_new
    @last_id = Address.last.id
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /people/new
  def new
    @person = Person.new
    @addresses = Address.order("created_at desc").all
  end

  # GET /people/1/edit
  def edit
    @addresses = Address.order("created_at desc").all
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)
    @p_addresses = Address.where(:id => params[:person_addresses])
    @person.addresses << @p_addresses

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: "La persona a sido creada. <a href='#{new_employee_path}'>Click aqui para registrarlo como funcionario</a>".html_safe }
        format.json { render :show, status: :created, location: @person }
      else
        @addresses = Address.order("created_at desc").all
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    @person = Person.find(params[:id])
    @p_addresses = Address.where(:id => params[:person_addresses])
    @person.addresses.destroy_all
    @person.addresses << @p_addresses
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'La persona ha sido actualizada.' }
        format.json { render :show, status: :ok, location: @person }
      else
        @addresses = Address.order("created_at desc").all
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'La persona ha sido eliminada de los registros.' }
      format.json { head :no_content }
    end
  end

  def addresses_new
      @address = Address.new
      @cities = City.all
      @departamentos = Departamento.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :doc, :phone, :email, :sex, :birthdate)
    end
end
