class VacationsController < ApplicationController

    def index
        @vacations = Vacation.all
    end

    def new
        @vacation = Vacation.new
    end

    def show
        @vacation = Vacation.find_by(:id => params[:id])
    end

    def edit
        @vacation = Vacation.find_by(:id => params[:id])
    end

    def create
       @vacation = Vacation.new(vacation_params)
       @vacation.user = current_user
       if @vacation.save
        flash[:notice] = "Vacation Created."
        redirect_to vacation_path(@vacation)
       else
        flash[:notice] = "Test"
        redirect_to root_path
       end
    end

    def update
        @vacation = Vacation.find_by(:id => params[:id])
        @vacation.update(vacation_params)
        redirect_to vacation_path(@vacation)
    end

    def destroy
        @vacation = Vacation.find_by(params[:id])
        @vacation.destroy
        flash[:notice] = "Vacation Deleted."
        redirect_to vacations_path
    end

    private
    def vacation_params
        params.require(:vacation).permit(:name, :start_date, :end_date)
    end
end