class TopController < ApplicationController
  def index
    @contents = Content.order(created_at: :desc)
    @contents = Kaminari.paginate_array(@contents).page(params[:page]).per(10)
  end
end
