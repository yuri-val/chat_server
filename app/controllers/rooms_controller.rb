class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy, :join, :leave]

  # GET /rooms
  def index
    @rooms = Room.all
    render json: @rooms
  end

  # GET /rooms/1
  def show
    render json: @room
  end

  # POST /rooms
  def create
    @room = Room.new(room_keys)

    if @room.save
      render json: @room, status: :created
    else
      render json: { errors: @room.errors }, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    if @room.update(room_params)
      render json: @room
    else
      render json: { errors: @room.errors }, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    if @room.destroy
      render json: { result: "room removed successfully" }
    else
      render json: { errors: @room.errors }, status: :unprocessable_entity
    end
  end

  # POST /rooms/1/join
  def join
    user  = User.find params[:user_id]
    if @room.users << user
      render json: { result: 'user successfully joined the room' }
    else
      render json: { errors: @room.errors }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  # POST /rooms/1/leave
  def leave
    user  = User.find params[:user_id]
    if @room.users.delete user
      render json: { result: 'user successfully left the room' }
    else
      render json: { errors: @room.errors }, status: :unprocessable_entity
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: 'User not found' }, status: :not_found
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id] || params[:room_id])
  end

  # Only allow a trusted parameter "white list" through.
  def room_params
    params.permit(:name, :user_id)
  end

  def room_keys
    { room_name: room_params[:name], creator_id: room_params[:user_id] }
  end
end
