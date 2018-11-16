class BandsController < ApplicationController
  def index
    @band = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      render json: @band.errors.full_messages, status: 422
    end
  end

  def new
    render :new
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def update
    @band = Band.find(params[:id])
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    if @band
      @band.destroy
      redirect_to bands_url
    else
      redirect_to bands_url
    end
  end

  def band_params
    params.require(:band).permit(:name)
  end
end
