class SongsController < ApplicationController

  self.before_action(:find_song, only: [:destroy, :edit, :update])

  def new
    render(:new)
  end

  def create
    Song.create(song_params)
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
    return {
      title: params[:title],
      year: params[:year],
      artist_id: params[:artist_id]
    }
  end
end