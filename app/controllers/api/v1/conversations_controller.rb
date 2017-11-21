class Api::V1::ConversationsController < ApplicationController

  # List of all conversations 
  def index
    @conversations = Conversation.all
    render json:  @conversations, status: :ok
  end

  # Check if conversation exists between two users 
  # Returns conversation if exists, otherwise creates a new conversation 
   def create
    to_id = params[:to_id]
    from_id = params[:from_id]

    if Conversation.where(to_id, from_id).present?
      @conversation = Conversation.from_or_to.first
    else
      @conversation = Conversation.create(conversation_params)
    end
  end

  private
    def conversation_params
      params.permit(:to_id, :from_id)
    end

end