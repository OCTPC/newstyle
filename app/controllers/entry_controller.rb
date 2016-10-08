class EntryController < ApplicationController
   before_action :set_id,only: [:show]
  def show
    
  end

  private 
  def set_id
    id = params[:id]
    @content = Content.find(id)
    @relations=Relationship.where(:a_id => id)
    @relatedArticles=[]
    @relations.each do |artc|
      @relatedArticles.push(ContentsRelations.find(artc.b_id))
    end
  end
end
