class Admin::RegistriesController < Admin::BaseController
  before_action :find_registry, only: %i[show]

  def index
    @registries = Registry.all
  end

  def show; end

  private

  def find_registry
    @registry = Registry.find(params[:id])
  end

end
