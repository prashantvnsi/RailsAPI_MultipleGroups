class RegionsController < ApplicationController

    def index
        @regions = Region.all
        render json: @regions
    end


    def show
        @regions = Region.find(params[:id])
        render json: @region
    end


    def create
        @region = Region.new(region_params)
        if @region.save
            render json: @region
        else
            render error: {error: 'Unable to create region.'}, status: 400
        end
    end

    def update
        @region = region.find(params[:id])
        if @region
            @region.update(region_params)
            render json: {message: 'Region successfully updated.'}, status: 200
        else
            render json: {message: 'Unable to delete region'}, status: 400
        end
    end

    def destroy
        @region = region.find(params[:id])
        if @region
            @region.destroy
            render json: {message: 'Region successfully removed.'}, status: 200
        else
            render json: {message: 'Unable to remove region'}, status: 400
        end
    end

    private

    def region_params
        params.require(:region).permit(:name)
    end

end
