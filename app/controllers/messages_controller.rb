class MessagesController < ApplicationController
  respond_to :html, :json

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(params[:message])
    @message.save
  end
end
