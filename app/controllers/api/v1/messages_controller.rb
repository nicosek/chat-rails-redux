class Api::V1::MessagesController < ApplicationController
  before_action :retrieve_channel

  def index
    messages = Message.where(channel: @channel).map { |message| { id: message.id, \
                                                                  author: get_username(message.user.email), \
                                                                  content: message.content, \
                                                                  created_at: message.created_at }}

    render json: messages
  end

  def create
    puts params[:content]
    @message = Message.new(content: message_params[:content])
    @message.user = current_user
    @message.channel = Channel.find_by(name: message_params[:channel])
    @message.save!
    render json: {
      id: @message.id, author: get_username(@message.user.email), content: @message.content, created_at: @message.created_at
    }
  end

  private

  def retrieve_channel
    @channel = Channel.find_by(name: params[:channel_id])
  end

  def get_username(email)
    email.split('@').first
  end

  def message_params
    params.permit(:content, :channel)
  end
end
