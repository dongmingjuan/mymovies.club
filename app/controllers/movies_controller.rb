class MoviesController < ApplicationController
                  before_action :authenticate_user!
                  def index
                                   @movies = Movie.all
                  end
                  def new
                                    @movie = Movie.new
                  end
                  def create
                                    @movie = Movie.new(movie_params)
                                    @movie.user = current_user
                                    if @movie.save
                                                      redirect_to movies_path
                                    else
                                                      render :new
                                    end
                  end
                  def show
                                    @movie = Movie.find(params[:id])
                                    @comments = @movie.comments
                  end
                  def edit
                                    @movie = Movie.find(params[:id])
                  end
                  def update
                                    @movie = Movie.find(params[:id])
                                    if @movie.update(movie_params)
                                                      redirect_to movies_path
                                    else
                                                      render :edit
                                    end
                  end
                  def destroy
                                     @movie = Movie.find(params[:id])
                                     @movie.destroy
                                     redirect_to movies_path
                  end
                  private
                  def movie_params
                                    params.require(:movie).permit(:title, :description, :image)
                  end

end
