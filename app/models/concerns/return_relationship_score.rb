require 'natto'
require 'json'
require 'uri'
require 'net/http'
require 'pp'
require 'matrix' 

module ReturnRelationshipScore
  extend ActiveSupport::Concern

  def calculate_relationship(*str)
    #関連度を1~0で返す
    #引数：文字列x２
    #返り値:1~0の小数（Floatクラス）
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

    max = str[0]
    str = str[1]

    max = Vector.elements(max)
    str = Vector.elements(str)
    return max.inner_product(str) / max.inner_product(max).to_f
  end
end
