class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)

    if @message.save
      SendMessageJob.perform_now message: @message
      render json: { result: "message successfully sent" }
    else
      render json: { errors: @message.errors }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.permit(:user_id, :room_id, :message)
  end
end
