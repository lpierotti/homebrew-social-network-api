class MessageSendJobJob < ApplicationJob
  queue_as :default

  def perform(room, message)
    ChatroomChannel.broadcast_to(room, message: MessagesController)
  end
end
