class Content < ActiveRecord::Base
  has_many :a_relationship, :class_name => 'Content', :foreign_key => 'a_id', :dependent => :destroy
  has_many :b_relationship, :class_name => 'Content', :foreign_key => 'b_id', :dependent => :destroy

#When content is created
  #
after_create :adding_relationship_score

private
def adding_relationship_score
  #write down here to action when the database new content is added
end

end

