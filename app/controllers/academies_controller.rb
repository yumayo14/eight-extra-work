class AcademiesController < ApplicationController

  def create
    @academy = Academy.new(academy_params)
    @academy.save
  end

private

  def academy_params
    params.require(:academy).permit(:school_type, :name, :major, :degree, :from, :to).merge(user_id: current_user.id)
  end

end