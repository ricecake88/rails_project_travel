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
    end

    def create
        if params[:vacation_id]
            @leg = Leg.new(leg_params)
        else
        end
        @leg = Leg.new(leg_params)
        if @leg.save!
            redirect_to leg_path(@leg)
        else
            flash[:notice] = "Fail creatuib if keg"
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