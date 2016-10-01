class CategoryController < ApplicationController
  before_action :set_category ,only: [:show]

  def show
    #category = params[:category]
    #@contents =Content.where(:category => category)
    #@contents = Kaminari.paginate_array([@contents]).page(params[:page]).per(1)

  end

  private 
  def set_category
    category = params[:category]
    @contents =Content.where(:category => category)
    @contents = Kaminari.paginate_array(@contents).page(params[:page]).per(1)
  end
end
