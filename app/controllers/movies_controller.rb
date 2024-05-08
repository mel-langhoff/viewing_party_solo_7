class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @facade = MovieSearchFacade.new(params[:search_params])
  end

  def show
    @user = User.find(params[:user_id])
    @facade = MovieDataFacade.new(params[:id])
  end
end