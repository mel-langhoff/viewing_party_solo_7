class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params[:search_param])
  end

  def show
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params[:search_param])
    @cast_members = @facade.cast(params[:id])
    @movie = @facade.movie(params[:id])
    @reviews = @facade.reviews(params[:id])
  end
end