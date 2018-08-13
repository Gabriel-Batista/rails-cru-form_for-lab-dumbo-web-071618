class GenresController < ApplicationController
    def index
        @genres = Genre.all
    end

    def show
        @genre = Genre.find(params[:id])
        @songs = @genre.songs.all
        @artists = @genre.artists.all
    end
    
    def new
    end

    def create
        genre = Genre.create(genre_params)
        redirect_to genre
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        genre = Genre.find(params[:id])
        genre.update(genre_params)
        redirect_to genre
    end

    def delete
    end

    private

    def genre_params
        params.require(:genre).permit(:name)
    end
end
