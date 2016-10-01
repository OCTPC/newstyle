class EntryController < ApplicationController
   before_action :set_id,only: [:show]
  def show
    
  end

  private 
  def set_id
    id = params[:id]
    @content = Content.find(id)
  end
end
