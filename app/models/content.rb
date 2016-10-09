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
 
  belongs_to :relations
 
  #記事取得
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
  #関連サイト検索
  #def testualdhfhslhelr
    ContentsRelations.delete_all
    Relationship.delete_all
    Content.order(created_at: :desc).each do |a|
       keywords=get_keywords(a.summary)
       if keywords==nil then
         next
       end
       toSearch=keywords.keys.join(" ")
       File.write("lastSearch.txt", toSearch.force_encoding("UTF-8"))
       searched,raw=search(toSearch)
       File.write("last.json", raw.force_encoding("UTF-8"))
       if searched["items"]==nil then
         next
       end
       cmp=[]
       cmp.push(searched["items"][0])
       cmp.push(searched["items"][1])
       cmp.push(searched["items"][2])
       cmp.each do |obj|
          if obj == nil
             next
          end
          url=obj["link"]
          title,body,url = get_article(url)
          q = ContentsRelations.new
          q.title = title.force_encoding("utf-8")
          q.body = body.force_encoding("utf-8")
          q.url = url.force_encoding('UTF-8')
          summary = get_summary(title,body).force_encoding('UTF-8')
          if summary=="" then
            next
          else
            q.summary=summary
          end
          q.category = a.category
          q.save
          
          parentId=a.id
          childId=q.id
          rel=Relationship.new
          rel.a_id=parentId
          rel.b_id=childId
          rel.score=relationRatio(a.body,q.body)
          rel.save
       end
    #end
    #def removeEqualData
      ContentsRelations.all.each do |data|
        childId=data.id
        rel=Relationship.find(:b_id => childId)
        cont=Contents.find(:id => rel.a_id)
        if data.url==cont.url then
          data.destroy
          rel.destroy
        end
      end
    #end
  end

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

