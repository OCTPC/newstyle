#return_summary.rb
require 'net/http'

module ReturnSummary
  extend ActiveSupport::Concern
  #titleとbodyを入れると要約文を返す
  def get_summary(title,body)
    enc = "utf-8"
    debug = 0
    uri = URI('http://www.47news.jp/cgi-bin/ra/meta_ex.cgi')
    res = Net::HTTP.post_form(uri, 'title' => title, 'body' => body, 'summaxlength' => '250')
    return res.body
  end
end
