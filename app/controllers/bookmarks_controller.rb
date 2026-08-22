class BookmarksController < ApplicationController
  before_action :set_bookmark, only: [ :destroy ]

  def create
      @movie = Movie.find(params[:movie_id])
      @list = List.find(params[:list_id])
      @bookmark = @list.bookmarks.create(bookmark_params)
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to movie_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
   params.require(:bookmark).permit(:comment)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
