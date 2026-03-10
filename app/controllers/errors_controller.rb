class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!

  def not_found
    render :not_found, status: :not_found
  end

  def internal_server_error
    render :internal_server_error, status: :internal_server_error
  end
end
