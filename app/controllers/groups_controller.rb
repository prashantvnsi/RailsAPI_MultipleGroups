class GroupsController < ApplicationController

    before_action :authenticate_user

    def index
        @groups = Region.find(params[:region_id]).groups
        render json: @groups
    end


    def show
        @group = Region.find(params[:region_id]).groups.find(params[:id])
        render json: @group
    end


    def create
        @group = Region.find(params[:region_id]).groups.new(group_params)
        if @group.save
            render json: @group
        else
            render error: {error: 'Unable to create group.'}, status: 400
        end
    end

    def update
        @group = Region.find(params[:region_id]).groups.find(params[:id])
        if @group
            @group.update(group_params)
            render json: {message: 'Group successfully updated.'}, status: 200
        else
            render json: {message: 'Group to delete region'}, status: 400
        end
    end

    def destroy
        @group = Region.find(params[:region_id]).groups.find(params[:id])
        if @group
            @group.destroy
            render json: {message: 'Group successfully removed.'}, status: 200
        else
            render json: {message: 'Unable to remove group'}, status: 400
        end
    end

    private

    def group_params
        params.require(:group).permit(:name)
    end

end
