class LegsController < ApplicationController
    def index
        @legs = current_user.legs
    end

    def show
        @leg = Leg.find_by(:id => params[:id])
    end
end