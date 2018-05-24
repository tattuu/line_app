class MessageBroadcastJob < ApplicationJob
  queue_as :default


  def perform(message)
    logger.debug("7")
    # Do something later
    group = message.group
    RoomChannel.broadcast_to(group, message: render_message(message))
  end

  private
    def render_message(message)
      logger.debug("8")
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end
end
