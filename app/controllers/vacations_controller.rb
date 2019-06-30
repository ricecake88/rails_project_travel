class VacationsController < ApplicationController

    def index
        @vacations = Vacation.all
    end

    def new
        @vacation = Vacation.new
    end

    def show
    end

    def create
        @vacation = Vacation.create!(vacation_params)
    end

    def update
        @vacation = Vacation.find_by(:id => params[:id])
    end

    def destroy
    end

    private
    def vacation_params
    end
end