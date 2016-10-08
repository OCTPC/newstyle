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
    enc = "utf-8"
    debug = 0
    start ="<SUMMARY>"
    termi ="</SUMMARY>"
    uri = URI('http://www.47news.jp/cgi-bin/ra/meta_ex.cgi')
    begin
      res = Net::HTTP.post_form(uri, 'title' => title, 'body' => body, 'summaxlength' => '250')
      sleep(6)
      summary = return_between(res.body,start,termi)
      #doc = Nokogiri::HTML.parse("<html>"+res.body+"</html>", nil, "utf-8")
      #summary=doc.css("SUMMARY").inner_text
      if summary==nil then
        return ""
      else
        return summary
      end
    rescue Exception => ex
      puts "Exception"
      return ""
    end
  end
end
