class VacationsController < ApplicationController
    include Devise::Controllers::Helpers
    before_action :authenticate_user!, raise: false
    
    def index
        @vacations = current_user.vacations
    end

    def new
        @vacation = Vacation.new
    end

    def show
        @vacation = current_user.vacations.find_by(:id => params[:id])
       if @vacation.nil?
            flash[:notice] = "You don't have access to view that."
            redirect_to "/"
       else
            @sorted_legs = Leg.sort(@vacation.id)
       end

    end

    def edit
        @vacation = current_user.vacations.find_by(:id => params[:id])
        if @vacation.nil?
            flash[:notice] = "You don't have access to view that."
            redirect_to "/"
        end
    end

    def create
       @vacation = current_user.vacations.new(vacation_params)
       if @vacation.save
        flash[:notice] = "Vacation Created."
        redirect_to vacation_path(@vacation)
       else
        flash[:notice] = "Error in creating vacation."
        flash[:alert] = helpers.flash_error_message(@vacation)
        render :new
       end
    end

    def update
        @vacation = current_user.vacations.find_by(:id => params[:id])
        if !@vacation.present?
            flash[:notice] = "You don't have permissions to do that."
            redirect_to "/"
        else
            if @vacation.update(vacation_params)
                flash[:notice] = "Edit vacation successful."
                redirect_to vacation_path(@vacation)
            else
                flash[:notice] = "Editing vacation failed."
                flash[:alert] = helpers.flash_error_message(@vacation)
                redirect_to vacation_path(@vacation)
            end
        end
    end

    def destroy
        @vacation = current_user.vacations.find_by(:id => params[:id])
        if @vacation.present? && @vacation.destroy
            flash[:notice] = "Vacation Deleted."
            redirect_to vacations_path
        else
            flash[:notice] = "You don't have permissions to do that."
            redirect_to "/"
        end
    end

    private
    def vacation_params
        params.require(:vacation).permit(:name, :start_date, :end_date)
    end
end