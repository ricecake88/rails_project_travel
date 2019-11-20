class AttractionsController < ApplicationController
    before_action :authenticate_user!, raise: false, except: [:index, :show]

    def index
        if params[:destination_id] && Destination.exists?(:id => params[:destination_id])
            # need to create scope method here to find Destination and Attractions
            @attractions = Attraction.where(:destination_id => params[:destination_id])
            @destination = Destination.find_by(:id => params[:destination_id])
        else
            @attractions = Attraction.all
            redirect_to attractions_path
        end
    end

    def new
        @attraction = Attraction.new(:destination_id => params[:destination_id])
    end

    def show
        if params[:destination_id]
            @attraction = Attraction.find_by(:id => params[:id])
            @destination = @attraction.destination
        else
            flash[:notice] = "Incorrect URL."
            redirect_to attraction(attraction_id)
        end
    end

    def edit
        if params[:destination_id]
            @attraction = Attraction.find_by(:id => params[:id])
            @destination = @attraction.destination
        else
            flash[:notice] = "Invalid URL."
            redirect_to attraction_path(attraction)
        end
    end

    def create
        if params[:attraction][:destination_id]
            @attraction = Attraction.new(attraction_params)
            if @attraction.save
                flash[:notice] = "Attraction Created."
                redirect_to destination_attraction_path(@attraction.destination, @attraction)
            else
                flash[:notice] = "Adding Attraction Failed."
                redirect_to destination_path(@attraction.destination)
            end
        else
            flash[:notice] = "Invalid URL"
            redirect_to destinations_path
        end
    end

    def update
        @attraction = Attraction.find_by(:id => params[:id])
        if @attraction.update(attraction_params)
            flash[:notice] = "Updated Attraction"
            redirect_to destination_attraction_path(@attraction.destination, @attraction)
        else
            flash[:notice] = "Updating Attraction Failed"
            redirect_to destination_attractions_path(@attraction.destination)
        end
    end

    def destroy
        @attraction = Attraction.find_by(:id => params[:id])
        @destination = @attraction.destination
        @attraction.destroy
        flash[:notice]= "Attraction Deleted."
        redirect_to destination_attractions_path(@destination)
    end

    def under20
        if params[:destination_id]
            @attractions = Attraction.under_20(params[:destination_id])
            @destination = Destination.find_by(:id => params[:destination_id])
            if !@destination_id.present?
                flash[:alert] = "Destination not found."
                redirect_to '/'
            end
        else
            @attractions = Attraction.all
            redirect_to attractions_path
        end
    end

    private

    def attraction_params
        params.require(:attraction).permit(:name, :destination_id, :admission)
    end
end