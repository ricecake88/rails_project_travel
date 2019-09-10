class LegsController < ApplicationController
    def index
        if (params[:vacation_id])
            @legs = Vacation.find_by(:id => params[:vacation_id]).legs
        else
            flash[:notice] = "Cannot show this page"
            redirect_to legs_path
        end
    end

    def new
        @leg = Leg.new(:id => params[:id])
        @places = Place.all
    end

    def show
        @leg = Leg.find_by(:id => params[:id])
    end

    def create
        @leg = Leg.new(leg_params)
        Leg.insert_places(params)
        if @leg.save!
            redirect_to leg_path(@leg)
        else
            flash[:notice] = "Fail creating new leg"
            render new
        end
    end

    def edit
        @leg = Leg.find_by(:id => params[:id])
        @places = Place.all
    end

    def update
        @leg = Leg.find_by(:id => params[:id])
        if @leg.update(leg_params)
            redirect_to leg_path(@leg)
        else
            render :edit
        end
    end

    def destroy
        @leg = Leg.find_by(:id => params[:id])
        @vacation = @leg.vacation
        @leg.destroy
        flash[:notice] = "Leg Deleted."
        redirect_to vacation_path(@vacation)
    end

    private
    def leg_params
        params.require(:leg).permit(:arrival_place_id, :departure_place_id, :vacation_id)
    end

end