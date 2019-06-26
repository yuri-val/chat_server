class UsersController < ApplicationController
  before_action :find_user, except: %i[create index]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  private

  def find_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

end
