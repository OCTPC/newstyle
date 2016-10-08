class ContentsRelations < ActiveRecord::Base
  has_many :relationship, :class_name => 'ContentRelations', :foreign_key => 'a_id', :dependent => :destroy
  has_many :relationship, :class_name => 'ContentRelations', :foreign_key => 'b_id', :dependent => :destroy

  has_many :keyword, :class_name => 'Keyword', :foreign_key =>'content_id', :dependent => :destroy
  
  belongs_to :relations
end

