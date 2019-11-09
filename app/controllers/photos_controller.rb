class PhotosController < ApplicationController
    before_action :authenticate_user!

  def create
    @course = Course.find(params[:course_id])
    @course.photos.create(photo_params.merge(user: current_instructor))
    redirect_to place_path(@place)
  end

  private

  def photo_params
    params.require(:course).permit(:picture)
  end
end