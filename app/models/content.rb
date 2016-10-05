class Content < ActiveRecord::Base
  extend XmlParser
  extend ReturnRelationshipScore
  extend ReturnSummary
  extend ReturnKeyword
  extend ReturnTrendArticles
  extend ReturnArticleExtract
  has_many :relationship, :class_name => 'Content', :foreign_key => 'a_id', :dependent => :destroy
  has_many :relationship, :class_name => 'Content', :foreign_key => 'b_id', :dependent => :destroy

  has_many :keyword, :class_name => 'Keyword', :foreign_key =>'content_id', :dependent => :destroy

  #def get_trends
    
    ary = get_trend_articles(1)
    #logger.debug(pp ary)
    #
    (ary.length).times do |j|
      title,body  = get_article(ary[j])
      #logger.debug(p title, body)
=begin
       q = Content.new
        q.title = title
        q.body = body
        q.category = "news"
        q.save


      
    end


    ary.each do |i|
      title,body = get_article(i)
      logger.debug(p ary)

      (ary.length).times do |j|
        q = Content.new
        q.title = title[i
        q.body = body
        q.save
      end
     end

=end
    
  #end
  #When content is created
  #
  #after_save :adding_relationship_score

  #private
  #def adding_relationship_score
    #write down here to action when the database new content is added
    #last = Content.last.id  # get the least aticles id 
    #logger.debug(last +"を挿入しました")

  #end 
    end
end

