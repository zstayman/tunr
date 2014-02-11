class ArtistsController < ApplicationController

  self.before_action(:load_artist, only: [:show, :edit, :update, :destroy])

  def index
    @artists = Artist.all
    render(:index)
  end

  def show
    render(:show)
  end

  def create
    Artist.create(artist_params)
    redirect_to("/artists")
  end

  def new
    render(:new)
  end

  def edit
    render(:edit)
  end

  def update
    @artist.update(artist_params)
    redirect_to("/artists")
  end

  def destroy
    @artist.destroy
    redirect_to("/artists")
  end

  private

  def load_artist
    @artist = Artist.find(params[:id])
  end

  def artist_params
    return {
      name: params[:name],
      genre: params[:genre],
      photo_url: params[:photo_url]
    }
  end
end