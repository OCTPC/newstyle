class Content < ActiveRecord::Base
  extend XmlParser
 # extend ReturnRelationshipScore
  extend ReturnSummary
  extend ReturnKeyword
  extend ReturnTrendArticles
  extend ReturnArticleExtract
  extend Getnews
  has_many :relationship, :class_name => 'Content', :foreign_key => 'a_id', :dependent => :destroy
  has_many :relationship, :class_name => 'Content', :foreign_key => 'b_id', :dependent => :destroy

  has_many :keyword, :class_name => 'Keyword', :foreign_key =>'content_id', :dependent => :destroy

   def get_trends
    ary = get_trend_articles(14)
    (ary.length).times do |j|
      title,body,url  = get_article(ary[j])
       q = Content.new
        q.title = title.force_encoding("utf-8")
        q.body = body.force_encoding("utf-8")
        q.url = url.force_encoding('UTF-8')
        summary = get_summary(title,body).force_encoding('UTF-8')
        if summary=="" then
          next
        else
          q.summary=summary
        end
        q.category = "anime"
        q.save
    end
  end
  #def testualdhfhslhelr
    Content.order(created_at: :desc).each do |a|
       keywords=get_keywords(a.summary)
       toSearch=keywords.values.join(" ")
       searched,raw=search(toSearch)
       p raw
       break
    end
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

