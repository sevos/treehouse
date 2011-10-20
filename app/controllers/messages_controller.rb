class MessagesController < ApplicationController
  respond_to :html, :json

  def index
    @messages = Message.all
  end

  def create
    @message = Message.new(params[:message])
    if @message.save
      respond_with @message
    end
  end
end
