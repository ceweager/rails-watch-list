class ListsController < ApplicationController
  before_action :find_list, only: [:show]
  def index
    @lists = List.all
  end

  def show
    @movies = find_movies
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :movies)
  end

  def find_movies
    @list.bookmarks.map{ |bookmark| Movie.find(bookmark.movie_id)}
  end
end
