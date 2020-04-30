class MembersController < ApplicationController

    def index
        @members = Region.find(params[:region_id]).groups.find(params[:group_id]).members
        render json: @members
    end


    def show
        @member = Region.find(params[:region_id]).groups.find(params[:group_id]).members.find(params[:id])
        render json: @member
    end


    def create
        @member = Region.find(params[:region_id]).groups.find(params[:group_id]).members.new(member_params)
        if @member.save
            render json: @member
        else
            render error: {error: 'Unable to create member.'}, status: 400
        end
    end


    def update
        @member = Region.find(params[:region_id]).groups.find(params[:group_id]).members.find(params[:id])
        if @member
            @member.update(member_params)
            render json: {message: 'Member successfully updated.'}, status: 200
        else
            render json: {message: 'Unable to delete member'}, status: 400
        end
    end


    def destroy
        @member = Region.find(params[:region_id]).groups.find(params[:group_id]).members.find(params[:id])
        if @member
            @member.destroy
            render json: {message: 'Member successfully removed.'}, status: 200
        else
            render json: {message: 'Unable to remove member'}, status: 400
        end
    end


    private

    def member_params
        params.require(:member).permit(:fname, :lname)
    end

end
