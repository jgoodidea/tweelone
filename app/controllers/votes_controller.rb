class VotesController < ApplicationController
    def index
        create()
    end
    def create
        @vote = Vote.new()
        @vote.voter = current_user
        @vote.votable = Tweet.find(params[:format])
        if @vote.save
            redirect_to tweet_url(@vote.votable), notice: "You voted a tweet successfully."
        else
            render json: @vote.errors, status: :unprocessable_entity
        end
    end
    def destroy
        @vote = Vote.find_by votable: params[:id], voter: current_user.id
        if @vote.destroy
            redirect_to tweet_url(@vote.votable), notice: "You unvoted a tweet successfully."
        else
            render json: @vote.errors, status: :unprocessable_entity
        end
    end
end
