class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    if params[:query].present?
      @query = params[:query]
      @services = Service.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @services = Service.all
    end
  end

  def show
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

  def destroy
    @service.destroy
    redirect_to services_path
  end

private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :category, :price, :description, :availability, :primary_language, :target_language, :photo)
  end
end
