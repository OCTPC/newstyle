class Content < ActiveRecord::Base
  include XmlParser
  include ReturnRelationshipScore
  has_many :a_relationship, :class_name => 'Content', :foreign_key => 'a_id', :dependent => :destroy
  has_many :b_relationship, :class_name => 'Content', :foreign_key => 'b_id', :dependent => :destroy

  has_many :keyword, :class_name => 'Keyword', :foreign_key =>'content_id', :dependent => :destroy
  #When content is created
  #
  #after_save :adding_relationship_score

  #private
  #def adding_relationship_score
    #write down here to action when the database new content is added
    #last = Content.last.id  # get the least aticles id 
    #logger.debug(last +"を挿入しました")

  #end 

end

