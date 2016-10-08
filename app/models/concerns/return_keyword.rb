#return_keyword.rb
#キーワードを連想配列にして返す
module ReturnKeyword
  include ActiveSupport::Concern

  def get_keywords(sentence)
    begin
      sentence = URI.encode_www_form_component(sentence)
      uri = URI.parse("http://jlp.yahooapis.jp/KeyphraseService/V1/extract?appid=dj0zaiZpPUd6UTg3RUQ5Rk1QQSZzPWNvbnN1bWVyc2VjcmV0Jng9NmU-&output=json&sentence=#{sentence}")
      json = Net::HTTP.get(uri)
      results = JSON.parse(json)
      return results
    rescue Exception => ex
      puts "Exception"
      return nil
    end
  end

end

