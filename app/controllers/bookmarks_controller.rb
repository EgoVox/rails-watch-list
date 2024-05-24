class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create, :destroy]

  def create
    @bookmark = @list.bookmarks.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = @list.bookmarks.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
