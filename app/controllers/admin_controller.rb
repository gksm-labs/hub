class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!

  def index
  end

  private

  def require_admin!
    unless current_user.has_permission?(:manage_oauth) || current_user.has_permission?(:admin)
      flash[:alert] = "Nemáte prístup do tejto sekcie."
      redirect_to root_path
    end
  end
end
