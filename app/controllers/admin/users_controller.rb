class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: %[show]

  def index
  end

  def show
  end

  private

  def find_user
    @user = User.find(params[:id])
  end
end
