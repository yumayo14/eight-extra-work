class AcademiesController < ApplicationController

  def create
    @academy = Academy.new(academy_params)
    @academy.save
      if @academy.save(academy_params)
        redirect_to user_path(current_user.id)
      else
        render "show"
      end

  end

  def edit
  end

  def update
    @academy = Academy.find(params[:id])
    @academy.update(academy_params)
      if @academy.update(academy_params)
        redirect_to user_path(current_user.id)
      else
        render "show"
      end
  end

private

  def academy_params
    params.require(:academy).permit(:school_type, :name, :major, :degree, :from, :to).merge(user_id: current_user.id)
  end

end
