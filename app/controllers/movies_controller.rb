class MoviesController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params[:search_param])
  end

  def show
    @user = User.find(params[:user_id])
    @facade = MovieFacade.new(params[:id])
  end
end