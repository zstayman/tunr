class SongsController < ApplicationController

  before_action :load_artist
  before_action(:find_song, only: [:destroy, :edit, :update])


  def new
    @song = Song.new
    render(:new)
  end

  def create
    @song = @artist.songs.create(song_params)
    redirect_to artist_path(@artist)
  end

  def destroy
    @song.destroy
    redirect_to artist_path(@artist)
  end

  def edit
    render(:edit)
  end

  def update
    @song.update(song_params)
    redirect_to artist_path(@artist)
  end

  private

 def load_artist
    return @artist = Artist.find(params[:artist_id])
  end

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :year, :artist_id)
  end
end