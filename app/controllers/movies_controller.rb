class MoviesController < ApplicationController

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(allowed_parameters)
    if @movie.save
      redirect_to root_path
    else
      render 'movies/new'
    end
  end


  private
  def allowed_parameters
    params.require(:movie).permit(:name, :year, :synopsis)
  end

end