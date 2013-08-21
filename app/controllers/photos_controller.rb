class PhotosController < ApplicationController
  def index
    photos = Photo.where(id: params[:ids])
    render json: photos
  end

  def create
    photo = Album.find(params[:album_id]).photos.new(params[:photo])
    photo.save
    render json: photo
  end

  def show
    photo = Photo.find(params[:id])
    render json: photo
  end
end
