class BandsController < ApplicationController
  def index
    @band = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url
    else
      render json: @band.errors.full_messages, status: 422
    end
  end

  def new

  end

  def edit

  end

  def show
    @band = Band.find_by(id: params[:id])
      if @band
        render :show
      else
        redirect_to bands_url
      end
  end

  def update

  end

  def destroy

  end

  def band_params
    params.require(:band).permit(:name)
  end
end
