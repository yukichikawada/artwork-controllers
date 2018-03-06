class ArtworksController < ApplicationController
  def index
    all_art = []
    user = User.find(params[:user_id])

    all_art << user.shared_artworks
    all_art << user.artworks
    render plain: all_art
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
      render json: artwork
    else
      render json: artwork.errors.full_messages, status: 422
    end
  end

  def show
    artwork = Artwork.find(params[:id])
    redirect_to artworks_url
  end

  def update
    artwork = Artwork.find(params[:id])
    artwork.update!(artwork_params)
    render :index
  end

  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :artist_id, :image_url)
  end
end
