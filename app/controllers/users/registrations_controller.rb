class Users::RegistrationsController < Devise::RegistrationsController
# before_action :configure_sign_up_params, only: [:create]
# before_action :configure_account_update_params, only: [:update]
  before_filter :check_current_user
  before_action :authenticate_user!, :redirect_unless_admin,  only: [:new, :create]
  skip_before_action :require_no_authentication

  # GET /resource/sign_up
  def new
    @user = User.new
    people_not_register
  end

  # POST /resource
  def create
    @user = User.new(resource_params)
    @user_roles = Role.where(:id => params[:user_roles])
    @user.roles << @user_roles

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_path(@user), notice: 'El usuario ha sido añadido satisfactoriamente.' }
        format.json { render :show, status: :created, location: user_path(@user) }
      else
        people_not_register
        format.html { render :new }
        format.json { render json: user_path(@user).errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /resource/edit
  def edit
    people_not_register
  end

  # PUT /resource
  def update
    @user = User.find(params[:id])
    @user_roles = Role.where(:id => params[:user_roles])
    @user.roles.destroy_all
    @user.roles << @user_roles

    respond_to do |format|
      if @user.update(resource_params)
        format.html { redirect_to user_path(@user), notice: 'El Usuario ha sido actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: user_path(@user) }
      else
        people_not_register
        format.html { render :edit }
        format.json { render json: user_path(@user).errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource
  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  def cancel
    super
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end

  private
    # We can't rely on CanCanCan, as it relies on a params[:id] which isn't present, and by manually setting @user, the authorization isn't performed anymore. See https://github.com/ryanb/cancan/issues/452#issuecomment-88614091.
    def check_current_user
      redirect_to(new_user_session_path) unless current_user
    end

    def people_not_register
      @roles = Role.order("created_at desc").all
      @people = Person.order("created_at desc").where('id NOT IN (?)',User.all.map{|u| u.person_id })
    end

    def resource_params
      params.require(:user).permit(:person_id, :email, :password )
    end

    def redirect_unless_admin
      unless current_user.is_admin?
        flash[:error] = "Only admins can do that"
        redirect_to root_path
      end
    end
end
