class ChatroomChannel < ApplicationCable::Channel
  def subscribed
   @chatroom = Chatroom.find_by(name: params['room'])
   ChatroomUser.find_or_create_by(user_id: current_user.id, chatroom_id: @chatroom.id)
   users = @chatroom.users
   room = params['room']
   stream_from "chatroom:#{room}"
  end

  def send_message(data)
    @chatroom = Chatroom.find_or_create_by(name: params["room"])
    message = Message.create(body: data["message"], user_id: current_user.id, chatroom_id: @chatroom.id) 
    ChatroomChannel.broadcast_to params['room'], message: message
  end
  
  def start
  	byebug
  end
  def unsubscribed
    stop_all_streams
  end
end
