class MessagesController < ApplicationController
  before_action :poster_set, only: [:index, :create]
  before_action :follower_set, only: :index

  def index
    @message = current_user.messages.new

    @latest_company = current_user.companies.last

    @latest_card = current_user.cards.last

    @follower_company = @follower.companies.last

    room_messages = Message.where(receive_user_id: @follower.id, user_id: current_user.id) | (Message.where(receive_user_id: current_user.id, user_id: @follower.id))

    @viewed_messages = room_messages.sort{|new_message,old_message| new_message.created_at <=> old_message.created_at}
  end

  def create
    @message = current_user.messages.new(message_params)
    @message.save
      if @message.save
        respond_to do |format|
          format.html
          format.json
        end
      else
        render :index
      end
  end

private

  def poster_set
    @poster = current_user
  end

  def follower_set
    @follower = User.find_by(id: params[:user_id])
  end

  def message_params
    params.require(:message).permit(:message, :receive_user_id)
  end

end
