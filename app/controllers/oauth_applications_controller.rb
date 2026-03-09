class OauthApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_oauth_admin!
  before_action :set_application, only: %i[show edit update destroy]

  def index
    @applications = Doorkeeper::Application.ordered_by(:created_at)
  end

  def show
  end

  def new
    @application = Doorkeeper::Application.new
  end

  def create
    @application = Doorkeeper::Application.new(application_params)

    if @application.save
      flash[:notice] = I18n.t(:notice, scope: %i[doorkeeper flash applications create])
      redirect_to oauth_application_url(@application)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @application.update(application_params)
      flash[:notice] = I18n.t(:notice, scope: %i[doorkeeper flash applications update])
      redirect_to oauth_application_url(@application)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @application.destroy
      flash[:notice] = I18n.t(:notice, scope: %i[doorkeeper flash applications destroy])
    end

    redirect_to oauth_applications_url
  end

  private

  def require_oauth_admin!
    unless current_user.has_permission?(:manage_oauth)
      flash[:alert] = "You are not authorized to manage OAuth applications."
      redirect_to root_path
    end
  end

  def set_application
    @application = Doorkeeper::Application.find(params[:id])
  end

  def application_params
    params.require(:doorkeeper_application).permit(:name, :redirect_uri, :scopes, :confidential)
  end
end
