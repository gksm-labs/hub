class AdminController < ApplicationController
  before_action :authenticate_user!
  require_permission :admin

  def index
  end
end
