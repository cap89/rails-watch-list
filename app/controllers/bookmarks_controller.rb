class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @bookmark.list_id = params[:list_id] if params[:list_id].present?
    @movies = Movie.all
    @lists = List.all
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@bookmark.list), notice: 'Movie was successfully added to the list.'
    else
      @list = List.find(params[:bookmark][:list_id])
      @movies = Movie.all
      render 'lists/show'
    end
  end

  def destroy
    set_bookmark
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), notice: 'Movie was successfully removed from the list.'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :list_id, :comment)
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
