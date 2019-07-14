class LegsController < ApplicationController

    def new
        @leg = Leg.new
    end

    def show
        @leg = Leg.find_by(:id => params[:id])
    end

    def create
        @leg = Leg.new(leg_params)
        binding.pry
        if @leg.save!
            binding.pry
            redirect_to leg_path(@leg)
        else
            flash[:notice] = "Fail creation of Leg"
            render new
        end
    end

    def edit
        @leg = Leg.find_by(:id => params[:id])
    end

    def update
        @leg = Leg.find_by(:id => params[:id])
        if @leg.update(leg_params)
            redirect_to leg_path(@leg)
        else
            render :edit
        end
    end

    private
    def leg_params
        params.require(:leg).permit(:arrival_city_name, :vacation_id)
    end

end