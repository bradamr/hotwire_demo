class HomesController < ApplicationController
  def index
    @comments = Comment.by_descending
  end
end
