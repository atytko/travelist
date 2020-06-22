class NotesController < ApplicationController
    def index
        @note = Note.new
        @notes = Note.all
    end

    def show
        @note = Note.find(params[:id])
    end

    def new
        @note = Note.new 
    end

    def create
        require 'net/http'
        require 'json'

        @note = Note.new(note_params)
        
        @url = 'https://api.openweathermap.org/data/2.5/weather?q=' + @note.city + '&units=metric&appid=4f416da763a05965e2e042b8d89c100c'
        begin
            @uri = URI.parse(@url)
        rescue URI::InvalidURIError
            @uri = URI.parse(URI.escape(@url))
        end
        @response = Net::HTTP.get(@uri)
        @getCurrentCityWeather = JSON.parse(@response)

        if(@getCurrentCityWeather["cod"] == 200)
            @getCurrentCityTemp = @getCurrentCityWeather["main"]["temp"]
            @note.weather = @getCurrentCityTemp.round(1)
        end

        @note.save
        redirect_to notes_path
    end

    def edit
        @note = Note.find(params[:id])
    end

    def update
        @note = Note.find(params[:id])
        @note.update(note_params)

        redirect_to notes_path
        
    end

    def destroy
        @note = Note.find(params[:id])
        @note.destroy

        redirect_to notes_path
    end
    

    private

    def note_params
        params.require(:note).permit(:city, :message, :created_at)
    end

end
