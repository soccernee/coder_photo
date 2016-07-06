class PhotosController < ApplicationController
  def index
    @photos = Photo.page params[:page]
  end

  def show
  end
end
