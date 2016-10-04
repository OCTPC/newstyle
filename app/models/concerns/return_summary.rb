#return_summary.rb
require 'net/http'
require 'nokogiri'

module ReturnSummary
  extend ActiveSupport::Concern
  #titleとbodyを入れると要約文を返す
  def get_summary(title,body)
    enc = "utf-8"
    debug = 0
    uri = URI('http://www.47news.jp/cgi-bin/ra/meta_ex.cgi')
    res = Net::HTTP.post_form(uri, 'title' => title, 'body' => body, 'summaxlength' => '250')
    doc = Nokogiri::HTML.parse("<html>"+res.body+"</html>", nil, "utf-8")
    summary=doc.css("SUMMARY").inner_text
    return summary
  end
end
