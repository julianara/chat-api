class Api::V1::MessagesController < ApplicationController

  before_action :set_conversation

  # All messages in specified conversation 
  def index
    @messages = @conversation.messages
    render json: @messages
  end

  
  def create 
    if @message.save
      render json: @conversation
    else
      render json: {status 402, message: @message.errors.full_messages.to_sentence}
    end
  end

  private
    def message_params
      params.require(:message).permit(:msg_text, :from_id, :to_id)
    end

    def set_conversation
      @conversation = Conversation.find(params[:conversation_id])
    end
end