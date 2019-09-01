class PlacesController < ApplicationController

    def index
        @places = Place.all
    end

    def new
        @place = Place.new
    end

    def show
        @place = Place.find_by(:id => params[:id])
    end

    def create
        @place = Place.new(places_params)
        if @place.save
            flash[:notice] = "Place created."
            redirect_to place_path(@place)
        else
            flash[:notice] = "Place Failed."
            redirect_to places_path
        end
    end

    def edit
        @place = Place.find_by(:id => params[:id])
    end

    def update
        @place = Place.find_by(:id => params[:id])
        @place.update(places_params)
    end

    def destroy
        @place = Place.find_by(:id => params[:id])
        @place.destroy
        redirect_to places_path
    end

    private
    def places_params
        params.require(:place).permit(:city_name)
    end

end