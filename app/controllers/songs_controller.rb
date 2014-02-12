class SongsController < ApplicationController

  self.before_action(:find_song, only: [:destroy, :edit, :update])

  def new
    @artist = Artist.find(params[:artist_id])
    @song = Song.new
    render(:new)
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    redirect_to("/artists/#{params[:artist_id]}")
  end

  def destroy
    @song.destroy
    redirect_to("/artists/#{params[:artist_id]}")
  end

  def edit
    render(:edit)
  end

  def update
    @song.update(song_params)
    redirect_to("/artists/#{params[:artist_id]}")
  end

  private

  def find_song
    @song = Song.find(params[:id])
  end

  def song_params
    params.require(:song).permit(:title, :year, :artist_id)
  end
end