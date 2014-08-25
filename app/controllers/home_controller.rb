class HomeController < ApplicationController

  def index
    @movies = Movie.order(:year).reverse
  end
end