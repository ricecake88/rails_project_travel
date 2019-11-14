class AttractionsController < ApplicationController
    def index
        if params[:place_id] && Place.exists?(:id => params[:place_id])
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
        if params[:place_id]
            @attraction = Attraction.find_by(:id => params[:id])
            @place = @attraction.place
        else
            flash[:notice] = "Incorrect URL."
            redirect_to attraction
        end
    end

    def edit
        if params[:place_id]
            @attraction = Attraction.find_by(:id => params[:id])
            @place = @attraction.place
        else
            flash[:notice] = "Invalid URL."
        end
    end

    def create
        if params[:attraction][:place_id]
            @attraction = Attraction.new(attraction_params)
            if @attraction.save
                flash[:notice] = "Attraction Created."
                redirect_to place_attraction_path(@attraction.place, @attraction)
            else
                flash[:notice] = "Adding Attraction Failed."
                redirect_to place_path(@attraction.place)
            end
        else
            flash[:notice] = "Invalid URL"
            redirect_to places_path
        end
    end

    def update
        @attraction = Attraction.find_by(:id => params[:id])
        if @attraction.update(attraction_params)
            flash[:notice] = "Updated Attraction"
            redirect_to place_attraction_path(@attraction.place, @attraction)
        else
            flash[:notice] = "Updating Attraction Failed"
            redirect_to place_attractions_path(@attraction.place)
        end
    end

    def destroy
        @attraction = Attraction.find_by(:id => params[:id])
        @place = @attraction.place
        @attraction.destroy
        flash[:notice]= "Attraction Deleted."
        redirect_to place_attractions_path(@place)
    end

    def under20
        if params[:place_id]
            @attractions = Attraction.under_20(params[:place_id])
            @place = Place.find_by(:id => params[:place_id])
            if !@place.present?
                flash[:alert] = "Place not found."
                redirect_to '/'
            end
        else
            @attractions = Attraction.all
            redirect_to attractions_path
        end
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :place_id, :admission)
    end
end