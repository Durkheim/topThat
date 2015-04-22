class WelcomeController < ApplicationController

  def index #research how to take thumbnail of video
   if current_user
     @user = current_user
   end
   @video = Video.new
   @challenger_videos = PublicArena.all_challenger_videos
   render "index"
  end


#all you need to do is make sure that you get something tht ends in @challenger videos
# @challenger videos will be a collection of videos that have a public arena who's status is either 'open' 'closed' or 'in_battle'

  def show
    all_challenges = PublicArena.all_challenger_videos
    @battle_videos = []
    @closed_videos = []
    @open_videos = []

    all_challenges.map do |vid|
      if params[:status] == "in_battle" && vid.public_arena_as_challenger.status == "in_battle"
        @battle_videos << vid
      elsif params[:status] == "open" && vid.public_arena_as_challenger.status == "open"
        @open_videos << vid
      else params[:status] == "closed" && vid.public_arena_as_challenger.status == "closed"
        @closed_videos << vid
      end
    end
  end
end
