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
    if resource.admin? || resource.vendedor? || resource.asociado?
      orders_path
    elsif resource.personal_escolar?
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
