#xml_parser.rb
require 'rexml/document'

module Xml_parser
  extend ActiveSupport :: Concern
  # return_between(XML文,開始タグ,終了タグ)
  def return_between(unporsed, start, termi)
    unporsed =~ /#{start}(.*?)#{termi}/
    return $1
  end
end 
