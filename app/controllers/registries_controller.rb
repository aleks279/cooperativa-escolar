class RegistriesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[new create]
  before_action :find_user, only: %i[create]

  def new
    @registry = Registry.new
  end

  def create
    @registry = Registry.new(registry_params)
    @registry.user = @user
    @registry.time = Time.zone.now

    if @registry.save
      redirect_to new_registry_path
    else
      render :new
    end
  end

  private

  def find_user
    @user = User.find_by(registry_params[:registry][:id_number])
  end

  def registry_params
    params.require(:registry).permit(
      :registry_type, :notes
    )
  end
end
