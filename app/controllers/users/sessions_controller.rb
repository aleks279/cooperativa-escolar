class Users::SessionsController < Devise::SessionsController

  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  protected

  def after_sign_in_path_for(resource)
    if resource.is_admin? || resource.is_vendedor?
      admin_users_path
    elsif resource.is_personal_escolar?
      sign_out resource
    else
      super
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :user, User
      signin_path
    else
      super
    end
  end

end
