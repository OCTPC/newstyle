class TopController < ApplicationController
  def index
    @contents = Content.all
    @contents = Kaminari.paginate_array(@contents).page(params[:page]).per(10)
  end
end
