class CommentsController < ApplicationController
                  before_action :authenticate_user!
                  def new
                           @movie = Movie.find(params[:movie_id])
                           @comment = Comment.new
                  end
                  def create
                                    @movie = Movie.find(params[:movie_id])
                                    @comment = Comment.new(comment_params)
                                    @comment.movie = @movie
                                    @comment.user = current_user
                                    if @comment.save
                                                      redirect_to movie_path(@movie)
                                    else
                                                      render :new
                                    end
                  end
                  def edit
                                    @movie = Movie.find(params[:movie_id])
                                    @comment = Comment.find(params[:id])
                  end
                  def update
                                    @movie = Movie.find(params[:movie_id])
                                    @comment = Comment.find(params[:id])
                                    if @comment.update(comment_params)
                                                      redirect_to movie_path(@movie)
                                    else
                                                      render :edit
                                    end
                  end
                  def destroy
                                    @movie = Movie.find(params[:movie_id])
                                    @comment = Comment.find(params[:id])
                                    @comment.destroy
                                    redirect_to movie_path(@movie)

                  end
                  private
                  def comment_params
                                    params.require(:comment).permit(:content)
                  end
end
