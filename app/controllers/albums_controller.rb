class AlbumsController < ApplicationController


  def index
    @album = Album.all
    render :index
  end

  def create
    @bands = Band.all
    @album = Album.new(band_params)
    if @album.save
      render json: @album
    else
      render json: @album.errors.full_messages, status: 422
    end
  end

  def new
    render :new
  end

  def edit
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def update
    @album = Album.find(params[:id])
    if @album.update_attributes(album_params)
      redirect_to band_album_url(@album)
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    if @album
      @album.destroy
      redirect_to band_albums_url
    else
      redirect_to band_albums_url
    end
  end

  def album_params
    params.require(:album).permit(:title, :year, :band_id, :album_type)
  end
end
