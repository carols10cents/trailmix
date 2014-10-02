class SearchesController < ApplicationController
  def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_term.merge(user: current_user))
    render :show
  end

  private

  def search_term
    params.require(:search).permit(:term)
  end
end
