class AttractionsController < ApplicationController
    def index
        if params[:place_id]
            # need to create scope method here to find Place and Attractions
            @attractions = Attraction.where(:place_id => params[:place_id])
            @place = Place.find_by(:id => params[:place_id])
        else
            @attractions = Attraction.all
            redirect_to attractions_path
        end
    end

    def new
        @attraction = Attraction.new(:place_id => params[:place_id])
    end

    def show
    end

    def create
        @attraction = Attraction.new(attraction_params)
        if @attraction.save!
            redirect_to place_attraction_path(@attraction.place, @attraction)
        else
            flash[:notice] = "Adding Attraction Failed."
            redirect_to place_path(@place)
        end
    end

    private
    
    def attraction_params
        params.require(:attraction).permit(:name, :place_id)
    end
end