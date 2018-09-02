class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: %i[show edit update destroy]
  before_action :set_roles, only: %i[edit update new create]

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
    @title = :new
  end

  def create
    @title = :new
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_path(@user)
    else
      render 'new'
    end
  end

  def edit
    @title = :edit
  end

  def update
    @title = :edit
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_users_path
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :id_number,
      :role, :email, :password, :password_confirmation
    )
  end

  def set_roles
    @roles = User::Roleable::ROLES
  end
end
