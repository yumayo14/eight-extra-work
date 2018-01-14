class CardsController < ApplicationController

  def create
    @card = Card.new(card_params)
    @card.save
  end

  def update
    @card = Card.find(params[:id])
    @card.update(card_params)
  end

private
  def card_params
    params.require(:card).permit(:image).merge(user_id: current_user.id)
  end

end
