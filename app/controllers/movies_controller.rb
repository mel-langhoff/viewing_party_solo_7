class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params[:search_params])
    @movies = @facade.movies
  end

  def show
    @user = User.find(params[:user_id])
    @facade = MovieDataFacade.new(params[:id])
  end
end