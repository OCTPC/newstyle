#return_trend_articles.rb
#get_news.rb
require 'json'
require 'uri'
require 'net/http'
require 'pp'
require 'open-uri'

module ReturnTrendArticles
  extend ActiveSupport::Concern

  def get_trends_articles(genre_id)
    #init
    n = 15 #初期の最大記事取得数
    arry = []

    uri = URI.parse("https://api.apigw.smt.docomo.ne.jp/webCuration/v3/contents?APIKEY=676d482e466e5a62542f4e55335455776879736e65433432776d6c4471453632737778514e617449626c33&genreId=#{genre_id}&s=1&n=#{n}&lang=ja")
    json = Net::HTTP.get(uri)
    results = JSON.parse(json)

    n.times do |i|
      arry.push(results["articleContents"][i]["contentData"]["linkUrl"])
    end
    #配列でURLを返す
    return arry

  end

end
