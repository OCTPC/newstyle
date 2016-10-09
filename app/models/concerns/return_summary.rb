#return_summary.rb
require 'net/http'
require 'nokogiri'

module ReturnSummary
  extend ActiveSupport::Concern

  # return_between(XML文,開始タグ,終了タグ)
  def return_between(unporsed, start, termi)
    unporsed =~ /#{start}(.*?)#{termi}/
    return $1
  end

  #titleとbodyを入れると要約文を返す
  def get_summary(title,body)
    contents = preform_text(body)
    contents_copy = preform_text(body)

    title = mecab(title)
    title = delkey(title) 
    title = title.keys

    body= mecab(body)
    body = delkey(body) 
    body= body.keys
    if contents.empty? then
      result = contents.reject!{|item| item =~ /「.+|.+」| #{title}/ }
      puts result
    else
      result =  contents_copy.reject!{|item| item =~ /#{title}/ }
      puts result
    end
  end

  def preform_text(char) #句点で必ず改行をする
    char = char.gsub(/(\s)/,"")#空白行を削除
    char = char.gsub(/\n+/, "\n")
    char = char.gsub(/。/, "。\n")#句読点で改行
    char = char.split()
    return char
  end
end
