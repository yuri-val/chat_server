class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(args = {})
    message = args[:message]
    options = { serializer: MessageSerializer }
    resource = ActiveModelSerializers::SerializableResource.new(message, options)
    ActionCable.server.broadcast('message', resource.as_json)
  end
end
