class MessagesController < ApplicationController

  def index
    @message = Message.new
  end

  def show
    @message = Message.new
  end
end
