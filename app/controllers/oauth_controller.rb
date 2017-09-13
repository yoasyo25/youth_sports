class OauthController < ApplicationController
  skip_before_action :authorize!

  def new

  end

  def create
    user = User.create_with_oauth(request.env['omniauth.auth'])]
    redirect_to dashboard_index_path unless user.type.nil?
    redirect_to select_type_path if user.type.nil?
    session[:user_id] = user.id
    redirect_to dashboard_index_path
  end
end