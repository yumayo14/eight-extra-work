class MessagesController < ApplicationController
  before_action :poster_set, only: :index
  before_action :follower_set, only: :index

  def index
    @latest_company = current_user.companies.last

    @latest_card = current_user.cards.last

    @message = Message.new

    @follower_company = @follower.companies.last

    my_send_messages = Message.where(receive_user_id: @follower.id, user_id: current_user.id)

    my_received_message = Message.where(receive_user_id: current_user.id, user_id: @follower.id)

    room_messages = my_send_messages | (my_received_message)

    @viewed_messages = room_messages.sort{|new_message,old_message| new_message.created_at <=> old_message.created_at}
  end

  def create
    @message = Message.new(message_params)
    @message.save
      if @message.save
        respond_to do |format|
          format.json
        end
      else
        render "index"
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
    params.require(:message).permit(:message, :receive_user_id).merge(user_id: current_user.id)
  end

end
