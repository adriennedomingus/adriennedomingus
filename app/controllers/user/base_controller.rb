class User::BaseController < ApplicationController
  before_action :require_user

  def require_user
    render file: "/app/views/errors/not_found.html.erb" unless current_user
  end
end
