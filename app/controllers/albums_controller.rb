class AlbumsController < ApplicationController
  def index
    albums = Album.where(id: params[:ids])
    render json: albums
  end

  def create
    album = current_user.albums.new(params[:album])
    album.save
    render json: album
  end

  def show
    album = Album.find(params[:id])
    render json: album
  end
end
