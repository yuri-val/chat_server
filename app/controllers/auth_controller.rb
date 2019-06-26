class AuthController < ApplicationController
  before_action :authorize_request, except: :login

  # POST /auth/login
  def login
    @user = User.find_by_user_name(login_params[:user_name])
    @user = create_new_user unless @user.present?
    return render json: { error: @user.errors }, status: 400 if @user.errors.any?

    if @user&.authenticate(params[:password])
      render json: @user, serializer: AuthSerializer 
    else
      render json: { error: 'unauthorized' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:user_name, :password)
  end

  def create_new_user
    User.create(login_params)
  end
end
