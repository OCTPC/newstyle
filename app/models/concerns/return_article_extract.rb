# coding: utf-8
#get_article_extract.rb
#ニュース記事から本文を抽出する
require "open-uri"
require 'bundler/setup'

module ReturnArticleExtract
  extend ActiveSupport::Concern

  def get_article(url)
    open(url) do |io|
      html = io.read.force_encoding('utf-8')

      #エンコード自動判別

      #html = html.force_encoding("Shift_JIS")
      #html = html.force_encoding("UTF-8")
      #logger.debug(html)
      html = html.scrub('?')
      body, title = ExtractContent.analyse(html)

      return  title,body
    end
  end
end
