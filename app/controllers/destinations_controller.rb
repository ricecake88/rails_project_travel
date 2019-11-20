class DestinationsController < ApplicationController
    before_action :authenticate_user!, raise: false, except: [:index, :show]

    def index
        @destinations = Destination.all
    end

    def new
        @destination = Destination.new
    end

    def show
        @destination = Destination.find_by(:id => params[:id])
    end

    def create
        @destination = Destination.new(destination_params)
        if @destination.save
            flash[:notice] = "Destination created."
            redirect_to destination_path(@destination)
        else
            flash[:notice] = "Destination Failed."
            flash[:alert] = helpers.flash_error_message(@destination)
            redirect_to destinations_path
        end
    end

    def edit
        @destination = Destination.find_by(:id => params[:id])
    end

    def update
        @destination = Destination.find_by(:id => params[:id])
        if @destination.update(destination_params)
            redirect_to destination_path(@destination)
        else
            flash[:notice] = "Edit Destination Failed."
            redirect_to destinations_path
        end
    end

    def destroy
        @destination = Destination.find_by(:id => params[:id])
        @destination.destroy
        redirect_to destinations_path
    end

    def my_destinations
        @destinations = Destination.user_destinations(current_user)
    end

    private
    def destination_params
        params.require(:destination).permit(:city_name, :country_name)
    end

end