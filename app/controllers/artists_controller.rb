class ArtistsController < ApplicationController
    def index
        @artists = Artist.all
    end

    def show
        @artist = Artist.find(params[:id])
        @songs = @artist.songs.all
        @genres = @artist.genres.all
    end
    
    def new
    end

    def create
        new_artist = Artist.create(artist_params)
        redirect_to new_artist
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        artist = Artist.find(params[:id])
        artist.update(artist_params)
        redirect_to(artist)
    end

    def delete
    end

    private

    def artist_params
        params.require(:artist).permit(:name, :bio)
    end
end
