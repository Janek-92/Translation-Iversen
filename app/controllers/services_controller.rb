class ServicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    if params[:query].present?
      @query = params[:query]
      @services = Service.where("title ILIKE ?", "%#{params[:query]}%")
    else
      @services = Service.all
    end

    @markers = @services.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
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

  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path
  end

private

  def service_params
    params.require(:service).permit(:title, :category, :price, :description, :availability, :primary_language, :target_language, :photo, :training, :experience, :years_of_experience, :type_of_service)
  end
end
