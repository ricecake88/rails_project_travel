class LegsController < ApplicationController
    def index
        if (params[:vacation_id])
            @legs = Vacation.find_by(:id => params[:vacation_id]).legs
        else
            flash[:notice] = "Cannot show this page"
        end
    end

    def new
        @leg = Leg.new(:vacation_id => params[:vacation_id])
    end

    def show
        @leg = Leg.find_by(:id => params[:id])
        binding.pry
    end

    def create
        if params[:vacation_id]
        else
        end
        @leg = Leg.new(leg_params)
        if @leg.save!
            redirect_to vacation_leg_path(@leg.vacation)
        else
            flash[:notice] = "Fail"
            render new
        end
    end

    private
    def leg_params
        params.require(:leg).permit(:arrival_city_name, :vacation_id)
    end

end