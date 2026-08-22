class MoviesController < ApplicationController
  before_action :set_movie, only: [ :destroy, :edit, :show, :update ]
  def index
    @movies = Movie.all
  end

  def show
  end

  def update
    @movie.update(params[:movie])
    redirect_to list_path(@list)
  end

  def edit
  end

  def create
      @list = List.find(params[:list_id])
      @movie = @list.movies.create(movie_params)
  end

  def new
    @list = List.find(params[:list_id])
    @movie = Movie.new
    @movie.list = @list
    if @movie.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    redirect_to list_path(@movie.list), status: :see_other
  end

  private

  def movie_params
   params.require(:movie).permit(:title, :overview, :poster_url, :rating)
  end

  def set_movie
    @movie = Movie.find(params[:id])
  end
end
