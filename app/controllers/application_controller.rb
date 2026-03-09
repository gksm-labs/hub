class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  protect_from_forgery

  private

  def self.require_permission(permission, options = {})
    before_action(options) do
      unless current_user&.has_permission?(permission)
        flash[:alert] = t("errors.messages.missing_permissions")
        redirect_back(fallback_location: root_path)
      end
    end
  end
end
