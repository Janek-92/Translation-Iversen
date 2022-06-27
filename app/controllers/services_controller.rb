class ServicesController < ApplicationController
  def index
    if params[:query].present?
      @query = params[:query]
      @services = Service.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @services = Service.all
    end
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service.user = current_user
    @service.save!
    redirect_to services_path(@service)
  end

private

  def service_params
    params.require(:service).permit(:title, :category, :price, :description, :availability)
  end
end
