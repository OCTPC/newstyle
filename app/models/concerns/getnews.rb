require 'json'
require 'uri'
require 'net/http'
require 'pp'
require 'nokogiri'
require 'open-uri'
require 'mecab'
require 'natto'
require 'matrix' 


module Getnews
  extend ActiveSupport::Concern

	def relationRatio(*str)
		p str.length
		if str.length==0 then
			return 0
		end
		hash = []
	
		str.each{|i| 
		info = {}
		nm = Natto::MeCab.new
		nm.parse(i)do |n|
		info[n.surface] = []
		  n.feature.split(",").each{|k| 
		  k== "*" ? break : info[n.surface] << k}
		end
		info.delete("")
	
		del = []
		info.each do|key,val|
		s = val.size-1;c=0
		val.each{|j|
		if j =="名詞" then break
		elsif c==s then del << key
		end 	
		c =c+1
		}
		end
		del.each{|j| info.delete(j)}
	
			hash << info
		}
			
		list = []
	
		hash.each{|i|
			i.each_key{|k|
				flag=0
				list.each{|j|
					flag = 1 if j==k 
				}
				list << k if flag==0
			}
		}
	
		count_0 = 0
		data=[]
	
		str.each{|i|
			pstr = []
			nm = Natto::MeCab.new
			nm.parse(i)do |n|
				pstr << n.surface
			end
	
			vec = []
			list.each{|j|
				count=0
				pstr.each{|k|
					count = count+1 if k==j
				}
				vec << count
			}
		  str[count_0] = vec
		  count_0 = count_0+1
		}

		p data.length
		max = str[0]
		str = str[1]
	
		max = Vector.elements(max)#max should be an Array, but it's now nil
		str = Vector.elements(str)
		return max.inner_product(str) / max.inner_product(max).to_f
	end

	#文字列を分析してハッシュを返す
	def mecab(str)
	  info = {}
	  nm = Natto::MeCab.new
	  nm.parse(str)do |n|
		  info[n.surface] = []
	    n.feature.split(",").each{|i| 
	    i== "*" ? break : info[n.surface] << i}
	  end
	  info.delete("")
	  return  info
	end

	#引数から名詞以外のものを取り除く
	def delkey(hash)
		del = []
		hash.each do|key,val|
		s = val.size-1;c=0
		val.each{|i|
		if i =="名詞" then break
		elsif c==s then del << key
		end 	
		c =c+1
		}
		end
		del.each{|i| hash.delete(i)}
		return hash
	end

	def search(str)
	  q=URI.escape(str)
	  uri = URI.parse("https://www.googleapis.com/customsearch/v1?key=AIzaSyDozIsgcDr7diN-HD0exksDcRMtB7vAb9w&cx=004746405670118980280:hjdypwr4e0w&q=#{q}")
	  json = Net::HTTP.get(uri)
	  return result = JSON.parse(json),json
	end

	def del_same(str,array,n)
		return array.delete_if{|i|(/#{str[0...n]}/ =~ i["title"]).instance_of?(Fixnum)}
	end

	def del_wrong(str,array,n)
		str
		return array.delete_if{|i| relation(str,i["title"]) < n }
	end
end
