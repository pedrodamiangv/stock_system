class SettingsController < ApplicationController
  before_action :set_setting, only: [:show, :edit, :update, :destroy]

  # GET /settings
  # GET /settings.json
  def index
    @settings = Setting.paginate(:page => params[:page], :per_page => 5)
  end

  #For create new address
  def new_address_setting
    addresses_new
    @last_id = Address.last.id
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /settings/1
  # GET /settings/1.json
  def show
  end

  # GET /settings/new
  def new
    @setting = Setting.new
    @addresses = Address.order("created_at desc").all
  end

  # GET /settings/1/edit
  def edit
    @addresses = Address.order("created_at desc").all
  end

  # POST /settings
  # POST /settings.json
  def create
    @setting = Setting.new(setting_params)
    @s_addresses = Address.where(:id => params[:setting_addresses])
    @setting.addresses << @s_addresses

    respond_to do |format|
      if @setting.save
        format.html { redirect_to @setting, notice: 'Configuraciones guardadas.' }
        format.json { render :show, status: :created, location: @setting }
      else
        @addresses = Address.order("created_at desc").all
        format.html { render :new }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /settings/1
  # PATCH/PUT /settings/1.json
  def update
    @setting = Setting.find(params[:id])
    @s_addresses = Address.where(:id => params[:setting_addresses])
    @setting.addresses.destroy_all
    @setting.addresses << @s_addresses
    respond_to do |format|
      if @setting.update(setting_params)
        format.html { redirect_to @setting, notice: 'Configuraciones actualizadas.' }
        format.json { render :show, status: :ok, location: @setting }
      else
        @addresses = Address.order("created_at desc").all
        format.html { render :edit }
        format.json { render json: @setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /settings/1
  # DELETE /settings/1.json
  def destroy
    @setting.destroy
    respond_to do |format|
      format.html { redirect_to settings_url, notice: 'Configuración eliminada.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_setting
      @setting = Setting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def setting_params
      params.require(:setting).permit(:name, :phone, :email, :ruc, :description, :historic, :logo)
    end

    def addresses_new
      @address = Address.new
      @cities = City.all
      @departamentos = Departamento.all
  end
end
